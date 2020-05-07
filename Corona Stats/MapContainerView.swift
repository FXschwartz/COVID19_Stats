//
//  MapContainerView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct MapContainerView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()

    var body: some View {
        MapView(countryStats: $covidFetch.allCountries)
    }
}

struct MapContainerView_Previews: PreviewProvider {
    static var previews: some View {
        MapContainerView()
    }
}
