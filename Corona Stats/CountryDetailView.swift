//
//  CountryDetailView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct CountryDetailView: View {
    
    @ObservedObject var countryStatisticsRequest = CountryStatisticsFetchRequest()
    var countryName: String
    
    var body: some View {
        VStack {
            VStack {
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.confirmedCases.formatNumber() ?? "Error", name: "Confirmed Cases")
                    .padding(.top)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.activeCases.formatNumber() ?? "Error", name: "Active Cases")
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryStats?.newCases.formatNumber() ?? "Error"), name: "New Cases")
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.recoveryCases.formatNumber() ?? "Error", name: "Recovered Cases")
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.criticalCases.formatNumber() ?? "Error", name: "Critical Cases", color: .yellow)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.deaths.formatNumber() ?? "Error", name: "Deaths", color: .red)
                CountryDetailRow(number: "+" + (countryStatisticsRequest.detailedCountryStats?.newDeaths.formatNumber() ?? "Error"), name: "New Deaths", color: .red)
                CountryDetailRow(number: countryStatisticsRequest.detailedCountryStats?.testDone.formatNumber() ?? "Error", name: "Tests Done", color: .yellow)
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryStats?.fatalityRate ?? "Error") + "%", name: "Death %", color: .red)
                CountryDetailRow(number: String(format: "%.2f", countryStatisticsRequest.detailedCountryStats?.recoveredRate ?? "Error") + "%", name: "Recovery %", color: .green)


            }
            .background(Color("cardBackgroundGray"))
            .cornerRadius(8)
            .padding()
            
            Spacer()
        }
        .padding(.top, 25)
        .navigationBarTitle(countryName)
        .onAppear() {
            self.getStatistics()
        }
    }
    
    private func getStatistics() {
        countryStatisticsRequest.getStatsFor(country: self.countryName.replacingOccurrences(of: " ", with: "-"))
    }
}

