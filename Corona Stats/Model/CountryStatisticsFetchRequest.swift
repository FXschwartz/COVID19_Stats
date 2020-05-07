//
//  CountryStatisticsFetchRequest.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CountryStatisticsFetchRequest: ObservableObject {
    
    @Published var detailedCountryStats: DetailedCountryStats?
    
    let headers: HTTPHeaders = [
        "x-rapidapi-host": "covid-193.p.rapidapi.com",
        "x-rapidapi-key": "784ca60897msh1c74a3460f0e774p1e0c81jsn3e49095644d4"
    ]
    
    init() {
        
    }
    
    func getStatsFor(country: String) {
        
        AF.request("https://covid-193.p.rapidapi.com/statistics?country=\(country)", headers: headers).responseJSON { response in
            let result = response.data
            if result != nil {
                let json = JSON(result!)
                
                let country = json["response"][0]["country"].stringValue
                
                let deaths = json["response"][0]["deaths"]["total"].intValue
                let newDeaths = json["response"][0]["deaths"]["new"].intValue
                
                let tests = json["response"][0]["tests"]["total"].intValue
                
                let criticalCases = json["response"][0]["cases"]["critical"].intValue
                let totalCases = json["response"][0]["cases"]["total"].intValue
                let activeCases = json["response"][0]["cases"]["actove"].intValue
                let newCases = json["response"][0]["cases"]["new"].intValue
                let recoveredCases = json["response"][0]["cases"]["recovered"].intValue
                
                self.detailedCountryStats = DetailedCountryStats(countryName: country, confirmedCases: totalCases, newCases: newCases, recoveryCases: recoveredCases, criticalCases: criticalCases, activeCases: activeCases, deaths: deaths, newDeaths: newDeaths, testDone: tests)
            }
        }
    }
}
