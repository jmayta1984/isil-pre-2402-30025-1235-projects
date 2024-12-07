//
//  RestaurantListView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

struct RestaurantListView: View {
    
    init () {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
    }
    
    @StateObject var viewModel = RestaurantListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                if !viewModel.message.isEmpty {
                    Text(viewModel.message)
                }
                
                List {
                    ForEach(viewModel.restaurants ) { restaurant in
                        NavigationLink(destination: {
                            RestaurantDetailView(restaurant: restaurant)
                        }) {
                            RestaurantListItemView(restaurant: restaurant)

                        }
                    }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("Restaurants")
            
        }
        .onAppear{
            viewModel.getRestaurants()
        }
    }
}

#Preview {
    RestaurantListView().preferredColorScheme(.dark)
}
