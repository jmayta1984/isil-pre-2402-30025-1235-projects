//
//  PersistenceHelper.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation
import CoreData

struct PersistenceHelper {
    static let shared = PersistenceHelper()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "EatExplorerModel")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error loading Core Data Stores: \(error) ")
            }
        }
    }
}
