//
//  Meal.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

struct MealWrapper: Decodable {
    let meals: [MealResponse]
}

struct MealResponse: Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
}

struct Meal: Identifiable {
    let id: String
    let name: String
    let image: String
}
