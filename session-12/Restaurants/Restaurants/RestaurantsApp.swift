//
//  RestaurantsApp.swift
//  Restaurants
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI


@main
struct RestaurantsApp: App {
    let  googleMapManager = GoogleMapManager()
    var body: some Scene {
        WindowGroup {
            MapView()
        }
    }
}
