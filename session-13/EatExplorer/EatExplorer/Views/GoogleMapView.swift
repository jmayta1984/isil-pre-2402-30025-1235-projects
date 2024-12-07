//
//  GoogleMapView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation
import SwiftUI
import GoogleMaps


struct GoogleMapView: UIViewRepresentable {
    let restaurant: Restaurant
    
    
    func makeUIView(context: Context) -> GMSMapView {
        let position = CLLocationCoordinate2D(latitude: restaurant.latitude, longitude: restaurant.longitude)
        
        let camera = GMSCameraPosition(target: position, zoom: 15)
        
        let options = GMSMapViewOptions()
        options.camera = camera
        
        let map = GMSMapView(options: options)
        
        let marker = GMSMarker(position: position)
        marker.title = restaurant.title
        marker.snippet = restaurant.address
        
        marker.map = map
        
        return map
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
