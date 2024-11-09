//
//  Category.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

struct CategoryWrapper: Decodable {
    let categories: [CategoryResponse]
}

struct CategoryResponse: Decodable {
    let idCategory: String
    let strCategory: String
    let strCategoryThumb: String
    let strCategoryDescription: String
}

struct Category: Identifiable {
    let id: String
    let name: String
    let image: String
    let description: String
}
