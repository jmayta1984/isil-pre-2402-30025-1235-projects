//
//  RestaurantDAO.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation

class RestaurantDAO {
    
    static let shared = RestaurantDAO()
    
    let context = PersistenceHelper.shared.container.viewContext
    
    private func saveContext() {
        if context.hasChanges {
           do {
               try context.save()
           } catch let error {
               print(error)
           }
        }
    }
    
    func insert(restaurant: Restaurant) {
        let instance = RestaurantEntity(context: context)
        instance.title = restaurant.title
        instance.address = restaurant.address
        instance.id = Int16(restaurant.id)
        saveContext()
    }
    
    func delete(restaurant: Restaurant) {
        let instances = fetchById(restaurant: restaurant)
        for instance in instances {
            context.delete(instance)
        }
        saveContext()
    }
    
    func checkFavorite(restaurant: Restaurant) -> Bool {
        let instances = fetchById(restaurant: restaurant)
        return !instances.isEmpty
    }
    
    private func fetchById(restaurant: Restaurant) -> [RestaurantEntity] {
        let request = RestaurantEntity.fetchAllRestaurantsRequest()
        request.predicate = NSPredicate(format: "id == %i", restaurant.id)
        
        do {
            let instances = try context.fetch(request)
            return instances
            
        } catch let error {
            print("Error: \(error)")
        }
        
        return []
    }
    
    func fetchAll() -> [RestaurantEntity] {
        let request = RestaurantEntity.fetchAllRestaurantsRequest()
        
        do {
            return try context.fetch(request)
            
        } catch let error {
            print("Error: \(error)")
        }
        return []
    }
    
    
    
}
