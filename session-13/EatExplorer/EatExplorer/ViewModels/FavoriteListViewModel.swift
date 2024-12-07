//
//  FavoriteListViewModel.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject {
    @Published var favorites: [Favorite] = []
    
    let restaurantDao = RestaurantDAO.shared
    
    func getAllFavorites() {
        let instances = restaurantDao.fetchAll()
        let favorites = instances.map { instance in
            Favorite(id: instance.id, title: instance.title, address: instance.address)
        }
        self.favorites = favorites
    }
    

}
