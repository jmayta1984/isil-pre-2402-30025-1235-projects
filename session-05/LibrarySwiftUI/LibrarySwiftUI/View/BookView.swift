//
//  BookView.swift
//  LibrarySwiftUI
//
//  Created by user259661 on 10/4/24.
//

import SwiftUI

struct BookView: View {
    @StateObject var viewModel: BookViewModel = BookViewModel()
    @Environment(\.dismiss) var dismiss
    
    var onAddBook: (Book) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Title", text: Binding(
                    get: { viewModel.title },
                    set: { viewModel.updateTitle(title: $0)
                    
                }) ).padding().textFieldStyle(.roundedBorder)
                TextField("Author", text: Binding(
                    get: { viewModel.author },
                    set: { viewModel.updateAuthor(author: $0)
                    
                }) ).padding().textFieldStyle(.roundedBorder)
                
                TextField("Quantity", text: Binding(
                    get: { "\(viewModel.quantity)" },
                    set: { viewModel.updateQuantity(quantity: Int($0) ?? 0)
                    
                }) ).padding().textFieldStyle(.roundedBorder)
            }.navigationTitle("Book")
                .toolbar {
                    ToolbarItem (placement:.topBarTrailing){
                        Button(action: {
                            let book = Book(title: viewModel.title, author: viewModel.author, quantity: viewModel.quantity)
                            onAddBook(book)
                            dismiss()
                        }) {
                            Image(systemName: "square.and.arrow.down")
                        }
                    }
                }
        }
    }
}

#Preview {
    BookView { _ in }
}
