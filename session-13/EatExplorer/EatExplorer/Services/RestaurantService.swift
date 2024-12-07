//
//  RestaurantService.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation

class RestaurantService {
    
    func getRestaurants(completion: @escaping ([Restaurant]?, String?) -> Void) {
        let url = "https://sugary-wool-penguin.glitch.me/restaurants"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success {
                guard let data = data else {
                    completion(nil, "Error: \(message ?? "No data")")
                    return }
                
                do {
                    let resturantsResponse = try JSONDecoder().decode([RestaurantResponse].self, from: data)
                    let restaurants = resturantsResponse.map { resturantsReponse in
                        resturantsReponse.toRestaurant()
                    }
                    completion (restaurants, nil)
                } catch let error {
                    completion(nil, "Error: \(error.localizedDescription)")
                }
            } else {
                completion(nil, "Error: \(message ?? "No response")")
            }
        }
    }
}
