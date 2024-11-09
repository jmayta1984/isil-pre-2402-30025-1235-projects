//
//  MealService.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

class MealService  {
    
    func getMealsByCategory(category: String, completion: @escaping ([Meal]? , String?) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=\(category)"
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion(nil, message ?? "Error: no data")
                    return
                }
                
                do {
                    let wrapper = try JSONDecoder().decode(MealWrapper.self, from: data)
                    let meals = wrapper.meals.map { mealResponse in
                        Mapper.toMeal(response: mealResponse)
                    }
                    completion(meals, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message ?? "Error: No response")
            }
        }
        
    }
}
