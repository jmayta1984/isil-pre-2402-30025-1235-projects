//
//  Contact.swift
//  AgendaApp
//
//  Created by user259661 on 11/8/24.
//

import CoreData

class Contact: NSManagedObject, Identifiable {
    @NSManaged var company: String?
    @NSManaged var name: String?
    @NSManaged var phone: String?
    
    static func fetchAllContactRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }
}
