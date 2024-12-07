//
//  RestaurantListViewModel.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation

class RestaurantListViewModel: ObservableObject {
    @Published var restaurants: [Restaurant] = []
    @Published var message: String = ""
    
    func getRestaurants() {
        RestaurantService().getRestaurants { restaurants, message in
            DispatchQueue.main.async {
                if let message = message {
                    self.message = message
                }
                
                if let restaurants = restaurants {
                    self.restaurants = restaurants
                }
            }
        }
    }
    
  
    
}

