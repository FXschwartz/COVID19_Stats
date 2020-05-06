//
//  CountryStatRowView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct CountryStatRowView: View {
    
    var countryStats: CountryStats
    
    var body: some View {
        HStack {
            Text(countryStats.countryName)
                .fontWeight(.medium)
                .font(.subheadline)
                .lineLimit(2)
                .frame(width: 70, alignment: .leading)
            
            Spacer()
        
            Text(countryStats.confirmed.formatNumber())
                .font(.subheadline)
                .frame(height: 40)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryStats.deaths.formatNumber())
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.red)
                .padding(.leading, 5)
            
            Spacer()
            
            Text(countryStats.recovered.formatNumber())
                .frame(width: 50, height: 40, alignment: .center)
                .font(.subheadline)
                .foregroundColor(.green)
        }
    }
}

struct CountryStatRowView_Previews: PreviewProvider {
    static var previews: some View {
        CountryStatRowView(countryStats: testCountryStats)
    }
}
