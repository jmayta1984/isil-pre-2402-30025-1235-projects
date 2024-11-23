//
//  MapView.swift
//  Restaurants
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    var body: some View {
        Map {
            Marker ("ISIL", coordinate: CLLocationCoordinate2D(latitude: -12.1254673, longitude: -77.0254485))
        }
    }
}

#Preview {
    MapView()
}
