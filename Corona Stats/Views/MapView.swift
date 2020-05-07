//
//  MapView.swift
//  Corona Stats
//
//  Created by Preston Schwartz on 5/6/20.
//  Copyright © 2020 Preston Schwartz. All rights reserved.
//

import SwiftUI
import UIKit
import MapKit

struct MapView: UIViewRepresentable {

    @Binding var countryStats: [CountryStats]
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        var allAnnotations: [CoronaCaseAnnotation] = []
        
        for countryStat in countryStats {
            let title = countryStat.countryName + "\n Confirmed " + countryStat.confirmed.formatNumber() + "\n Death " + countryStat.deaths.formatNumber()
            let coordinate = CLLocationCoordinate2D(latitude: countryStat.latitude, longitude: countryStat.longitude)
            
            allAnnotations.append(CoronaCaseAnnotation(title: title, coordinate: coordinate))
        }
        
        uiView.annotations.forEach {
            uiView.removeAnnotation($0)
        }
        
        uiView.addAnnotations(allAnnotations)
    }
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        return MKMapView()
    }
}

class CoronaCaseAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}
