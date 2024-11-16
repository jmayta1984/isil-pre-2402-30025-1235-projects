//
//  ContactDetailView.swift
//  AgendaApp
//
//  Created by user259661 on 11/8/24.
//

import SwiftUI

struct ContactDetailView: View {
    
    @State var name: String = ""
    @State var company: String = ""
    @State var phone: String = ""
    @Environment(\.dismiss) var dismiss
    
    let onAddContact: (String, String, String) -> Void

    var body: some View {
        VStack {
            
            TextField("Name", text: $name).padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            TextField("Company", text: $company).padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            TextField("Phone", text: $phone).padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            
            Button(action: {
                onAddContact(name, company, phone)
                dismiss()
            } ) {
                Text("Save")
            }.padding().buttonStyle(.borderedProminent)
        }.padding()
    }
}

#Preview {
    ContactDetailView { _, _ , _ in
        
    }
}
