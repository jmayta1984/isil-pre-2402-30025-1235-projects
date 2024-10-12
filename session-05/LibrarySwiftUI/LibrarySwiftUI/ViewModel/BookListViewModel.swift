//
//  BookListViewModel.swift
//  LibrarySwiftUI
//
//  Created by user259661 on 10/4/24.
//

import Foundation

class BookListViewModel: ObservableObject {
    @Published private (set) var books: Books = []
    
    func addBook(book: Book)  {
        books.append(book)
    }
    
    func deleteBook(indexSet: IndexSet){
        books.remove(atOffsets: indexSet)
    }
}
