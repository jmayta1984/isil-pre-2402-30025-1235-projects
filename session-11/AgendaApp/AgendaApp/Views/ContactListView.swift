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
                    Text(contact.name ?? "")
                }
            }.navigationTitle("Agenda")
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
