//
//  RestaurantEntity.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import CoreData

class RestaurantEntity: NSManagedObject {
    @NSManaged var title: String
    @NSManaged var address: String
    
    func fetchAllRestaurantsRequest() -> NSFetchRequest<RestaurantEntity> {
        return NSFetchRequest<RestaurantEntity>(entityName: "RestaurantEntity")
    }
}
