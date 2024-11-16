//
//  ContactListView.swift
//  AgendaApp
//
//  Created by user259661 on 11/8/24.
//

import SwiftUI

struct ContactListView: View {
    @StateObject private var viewModel = ContactListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.contacts) { contact in
                    
                    NavigationLink(destination: ContactDetailView(contact: contact) { name, company, phone  in
                        contact.name = name
                        contact.company = company
                        contact.phone = phone
                        viewModel.updateContact()
                    }){
                        VStack (alignment: .leading){
                            Text(contact.name)
                            Text(contact.company)
                            Text(contact.phone)
                        }

                    }
                }.onDelete { indexSet in
                    
                    guard let index = indexSet.first else { return }
                    viewModel.deleteContact(contact: viewModel.contacts[index])
                }
            }.listStyle(PlainListStyle())
                .navigationTitle("Agenda")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: {
                            ContactDetailView { name, company, phone in
                                viewModel.addContact(name: name, company: company, phone: phone)
                            }
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContactListView()
}
