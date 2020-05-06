//
//  Model.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import Foundation

struct TotalStats {
    let confirmed: Int
    let critical: Int
    let deaths: Int
    let recovered: Int
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

struct CountryStats {
    let countryName: String
    let confirmed: Int64
    let critical: Int64
    let deaths: Int64
    let recovered: Int64

    let longitude: Double
    let latitude: Double
    
    var fatalityRate: Double {
        return (100.00 * Double(deaths)) / Double(confirmed)
    }
    
    var recoveredRate: Double {
        return (100.00 * Double(recovered)) / Double(confirmed)
    }
}

let testTotalStats = TotalStats(confirmed: 200, critical: 100, deaths: 20, recovered: 50)
let testCountryStats = CountryStats(countryName: "Test", confirmed: 200, critical: 300, deaths: 200, recovered: 29, longitude: 20, latitude: 200)
