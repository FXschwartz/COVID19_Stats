//
//  CovidFetchRequest.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CovidFetchRequest: ObservableObject {
    
    @Published var totalStats: TotalStats = testTotalStats
    @Published var allCountries: [CountryStats] = []
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-19-data.p.rapidapi.com",
        "x-rapidapi-key": "784ca60897msh1c74a3460f0e774p1e0c81jsn3e49095644d4"
    ]

    init() {
        getAllCountries()
        getCurrentTotals()
    }
    
    func getCurrentTotals() {

        AF.request("https://covid-19-data.p.rapidapi.com/totals?format=json", headers: headers).responseJSON { response in
            let result = response.data
            if result != nil {
                let json  = JSON(result!)
//                print(json)
                let confirmed = json[0]["confirmed"].intValue
                let deaths = json[0]["deaths"].intValue
                let recovered = json[0]["recovered"].intValue
                let critical = json[0]["critical"].intValue
                
                self.totalStats = TotalStats(confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered)
            } else {
                self.totalStats = testTotalStats
            }
        }
    }
    
    func getAllCountries() {
        AF.request("https://covid-19-data.p.rapidapi.com/country/all?format=json", headers: headers).responseJSON { response in
            let result = response.value
            var allCount: [CountryStats] = []
            
            if result != nil {
                let dataDictionary = result as! [Dictionary<String, AnyObject>]
                
                for countryStat in dataDictionary {
                    let countryName = countryStat["country"] as? String ?? "Error"
                    let longitude = countryStat["longitude"] as? Double ?? 0.0
                    let latitude = countryStat["latitude"] as? Double ?? 0.0

                    let confirmed = countryStat["confirmed"] as? Int64 ?? 0
                    let deaths = countryStat["deaths"]as? Int64 ?? 0
                    let recovered = countryStat["recovered"]as? Int64 ?? 0
                    let critical = countryStat["critical"]as? Int64 ?? 0

                    let country = CountryStats(countryName: countryName, confirmed: confirmed, critical: critical, deaths: deaths, recovered: recovered, longitude: longitude, latitude: latitude)
                    
                    allCount.append(country)
                }
            }
            
            self.allCountries = allCount.sorted(by: {$0.confirmed > $1.confirmed})
        }
    }
}
