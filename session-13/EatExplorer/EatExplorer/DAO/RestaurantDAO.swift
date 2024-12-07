//
//  RestaurantDAO.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation

class RestaurantDAO {
    
    let context = PersistenceHelper.shared.container.viewContext
    
    private func saveContext() {
        if context.hasChanges {
           do {
               try context.save()
               print("Se registró")
           } catch let error {
               print(error)
           }
        }
    }
    
    func insert(restaurant: Restaurant) {
        let instance = RestaurantEntity(context: context)
        instance.title = restaurant.title
        instance.address = restaurant.address
        saveContext()
    }
}
