//
//  RecentView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct RecentView: View {
    
    @ObservedObject var covidFetch = CovidFetchRequest()
    @ObservedObject var test = CountryStatisticsFetchRequest()

    @State var searchText = ""
    @State var isSearchVisible = false

    var body: some View {
        NavigationView {
            VStack {
                if isSearchVisible {
                    SearchView(searchText: $searchText)
                }
                TotalStatsView(totalStats: covidFetch.totalStats)
                ListHeaderView()
                List {
                    ForEach(covidFetch.allCountries.filter {
                        self.searchText.isEmpty ? true :
                            $0.countryName.lowercased().contains(self.searchText.lowercased())
                    }, id: \.countryName) { countryStats in
                        NavigationLink(destination: CountryDetailView(countryName: countryStats.countryName)) {
                            CountryStatRowView(countryStats: countryStats)
                        }
                        
                    }
                }
            }// End of VStack
                .navigationBarTitle("Recent Data", displayMode: .inline)
                .navigationBarItems(trailing:
                    Button(action: {
                        self.isSearchVisible.toggle()
                        if !self.isSearchVisible {
                            self.searchText = ""
                        }
                    }, label: {
                        Image(systemName: "magnifyingglass")
                    })
                )
        }// End of Navigation View
    }
}

struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
