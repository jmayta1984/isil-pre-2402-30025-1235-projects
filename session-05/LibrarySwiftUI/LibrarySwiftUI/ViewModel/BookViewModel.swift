//
//  BookViewModel.swift
//  LibrarySwiftUI
//
//  Created by user259661 on 10/4/24.
//

import Foundation

class BookViewModel: ObservableObject {
    @Published private (set) var title: String = ""
    @Published private (set) var author: String = ""
    @Published private (set) var quantity: Int = 0
    
    func updateTitle(title: String) {
        self.title = title
    }
    
    func updateAuthor(author: String) {
        self.author = author
    }
    
    func updateQuantity(quantity: Int) {
        self.quantity = quantity
    }
}
