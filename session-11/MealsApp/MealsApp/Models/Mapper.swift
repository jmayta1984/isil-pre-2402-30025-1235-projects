//
//  Mapper.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

struct Mapper {
    static func toCategory(response: CategoryResponse) -> Category {
        return Category(id:response.idCategory, name: response.strCategory, image: response.strCategoryThumb, description: response.strCategoryDescription)
    }
    
    static func toMeal(response: MealResponse) -> Meal {
        return Meal(id: response.idMeal, name: response.strMeal, image: response.strMealThumb)
    }
}
