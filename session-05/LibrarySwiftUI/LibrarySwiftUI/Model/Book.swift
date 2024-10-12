//
//  Book.swift
//  LibrarySwiftUI
//
//  Created by user259661 on 10/4/24.
//

import Foundation

typealias Books = [Book]

struct Book: Identifiable {
    let id: UUID = UUID()
    let title: String
    let author: String
    let quantity: Int
}
