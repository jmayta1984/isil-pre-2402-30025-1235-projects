//
//  ContentView.swift
//  Restaurants
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
       
        VStack {
            GoogleMapView(latitude:  -12.1254673, longitude: -77.0254485, zoom: 15)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

