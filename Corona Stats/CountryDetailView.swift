//
//  CountryDetailView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    var countryStats: CountryStats

    var body: some View {
        VStack {
            VStack {
                CountryDetailRow(number: countryStats.confirmed.formatNumber(), name: "Confirmed")
                    .padding(.top)
                CountryDetailRow(number: countryStats.critical.formatNumber(), name: "Critical", color: .yellow)
                CountryDetailRow(number: countryStats.deaths.formatNumber(), name: "Deaths", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryStats.fatalityRate), name: "Death %", color: .yellow)
                CountryDetailRow(number: countryStats.recovered.formatNumber(), name: "Recovered", color: .green)
                CountryDetailRow(number: String(format: "%.2f", countryStats.recoveredRate), name: "Recovery %", color: .green)
            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 50)
        .navigationBarTitle(countryStats.countryName)
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(countryStats: testCountryStats)
    }
}
