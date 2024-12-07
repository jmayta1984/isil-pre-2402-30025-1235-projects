//
//  RestaurantResponse.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import Foundation

struct RestaurantResponse: Decodable {
    let id: Int
    let poster: String
    let title: String
    let description: String
    let address: String
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case poster
        case title
        case description
        case address
        case latitude
        case longitude
    }
    
    func toRestaurant() -> Restaurant {
        return  Restaurant(id: id, title: title, description: description, poster: poster, address: address, latitude: latitude, longitude: longitude)
    }
}
