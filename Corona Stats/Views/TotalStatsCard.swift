//
//  TotalStatsCard.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI

struct TotalStatsCard: View {
    var number: String = "Error"
    var name: String = "Confirmed"
    var color: Color = .primary

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text(self.number)
                    .font(.subheadline)
                    .padding(5)
                    .foregroundColor(self.color)
                Text(self.name)
                    .font(.body)
                    .padding(5)
                    .foregroundColor(self.color)
            }// End of VStack
                .frame(width: geometry.size.width, height: 80, alignment: .center)
                .background(Color("cardBackgroundGray"))
                .cornerRadius(8.0)
        }// End of Geometry
    }
}

struct TotalStatsCard_Previews: PreviewProvider {
    static var previews: some View {
        TotalStatsCard()
    }
}
