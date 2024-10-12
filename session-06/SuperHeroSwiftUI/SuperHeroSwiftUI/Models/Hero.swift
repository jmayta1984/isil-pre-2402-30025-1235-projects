//
//  Hero.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import Foundation

struct Hero: Identifiable {
    let id: String
    let name: String
    let fullName: String
    let url: String
}


struct ResponseWrapper: Decodable {
    let results: [HeroResponse]
}

struct HeroResponse: Decodable {
    let id: String
    let name: String
    let biography: Biography
    let image: HeroImage
    
    func toHero() -> Hero {
        Hero(id: id, name: name, fullName: biography.fullName, url: image.url)
    }
}

struct Biography: Decodable {
    let fullName: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
    }
}

struct HeroImage: Decodable {
    let url: String
}
