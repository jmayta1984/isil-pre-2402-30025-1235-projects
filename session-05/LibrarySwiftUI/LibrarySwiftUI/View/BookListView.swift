//
//  BookListView.swift
//  LibrarySwiftUI
//
//  Created by user259661 on 10/4/24.
//

import SwiftUI

struct BookListView: View {
    @ObservedObject var viewModel: BookListViewModel
    
    var body: some View {
        NavigationStack {
            VStack{
                List {
                    ForEach(viewModel.books) { book in
                        HStack {
                            VStack (alignment: .leading) {
                                Text(book.title).font(.title)
                                Text(book.author)
                            }
                            Spacer()
                            Text("\(book.quantity)")
                        }
                        
                    }.onDelete(perform: viewModel.deleteBook)
                }
            }.navigationTitle("Library")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(destination: {
                            BookView  {book in
                                viewModel.addBook(book: book)
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
    BookListView(viewModel: BookListViewModel())
}
