//
//  EatExplorerApp.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

@main
struct EatExplorerApp: App {
    let googleMapHelper = GoogleMapHelper()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
