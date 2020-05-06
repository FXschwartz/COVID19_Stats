//
//  TotalStatsView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct TotalStatsView: View {
    var totalStats: TotalStats
    
    var body: some View {
        VStack {
            HStack {
                TotalStatsCard(number: totalStats.confirmed.formatNumber(), name: "Confirmed")
                TotalStatsCard(number: totalStats.critical.formatNumber(), name: "Critical", color: .yellow)
                TotalStatsCard(number: totalStats.deaths.formatNumber(), name: "Deaths", color: .red)
            }
            HStack {
                TotalStatsCard(number: String(format: "%.2f", totalStats.fatalityRate), name: "Death %", color: .red)
                TotalStatsCard(number: totalStats.recovered.formatNumber(), name: "Recovered", color: .green)
                TotalStatsCard(number: String(format: "%.2f", totalStats.recoveredRate), name: "Recovery %", color: .green)
            }
        }// End of VStack
            .frame(height: 170)
            .padding(10)
    }
}

struct TotalStatsView_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsView(totalStats: testTotalStats)
    }
}
