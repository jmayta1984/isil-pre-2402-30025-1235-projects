//
//  ContentView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            RestaurantListView().tabItem {
                Label("Restaurants", systemImage: "list.dash")
            }
            FavoriteListView().tabItem {
                Label("Favorites", systemImage: "heart")
            }
        }
    }
}

