//
//  RestaurantDetailViewModel.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import Foundation

class RestaurantDetailViewModel: ObservableObject {
    
    @Published private(set) var isFavorite = false
    
    let restaurantDao = RestaurantDAO.shared
    
    func isFavoriteToggle(restaurant: Restaurant) {
        isFavorite.toggle()
        isFavorite ? add(restaurant: restaurant) : remove(restaurant: restaurant)
    }
    
    private func add(restaurant: Restaurant) {
        restaurantDao.insert(restaurant: restaurant)
    }
    
    private func remove(restaurant: Restaurant) {
        restaurantDao.delete(restaurant: restaurant)
    }
    
    func checkFavorite(restaurant: Restaurant) {
        isFavorite = restaurantDao.checkFavorite(restaurant: restaurant)
    }
}
