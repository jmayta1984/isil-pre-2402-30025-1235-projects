//
//  CategoryService.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

class CategoryService  {
    
    func getAllCategories(completion: @escaping ([Category]? , String?) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/categories.php"
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion(nil, message ?? "Error: no data")
                    return
                }
                
                do {
                    let wrapper = try JSONDecoder().decode(CategoryWrapper.self, from: data)
                    let categories = wrapper.categories.map { categoryResponse in
                        Mapper.toCategory(response: categoryResponse)
                    }
                    completion(categories, nil)
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message ?? "Error: No response")
            }
        }
        
    }
}
