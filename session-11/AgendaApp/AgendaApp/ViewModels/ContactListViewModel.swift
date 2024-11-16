//
//  ContactListViewModel.swift
//  AgendaApp
//
//  Created by user259661 on 11/8/24.
//

import CoreData


class ContactListViewModel: ObservableObject {
    @Published var contacts: [Contact] = []
    
    private var context: NSManagedObjectContext = PersistenceController.shared.container.viewContext
    
    
    init() {
        self.fetchAllContacts()
    }
    
    func fetchAllContacts() {
        let request = Contact.fetchAllContactRequest()
        
        do {
            self.contacts = try context.fetch(request)
        } catch (let error) {
            print(error)
        }
    }
    
    func addContact(name: String, company: String, phone: String) {
       let contact = Contact(context: context)
        contact.name = name
        contact.company = company
        contact.phone = phone
        saveContext()
        fetchAllContacts()
    }
    
    func deleteContact(contact: Contact) {
        context.delete(contact)
        saveContext()
    }
    
    func updateContact(){
        saveContext()
    }

    
    private func saveContext() {
        if context.hasChanges {
            do {
               try context.save()
            } catch (let error) {
                print(error)
            }
        }
    }
}
