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
    let publisher: String
    let placeOfBirth: String
    let intelligence: Int
    let strength: Int
    let speed: Int
    let durability: Int
    let power: Int
    let combat: Int
}


struct ResponseWrapper: Decodable {
    let results: [HeroResponse]
}

struct HeroResponse: Decodable {
    let id: String
    let name: String
    let biography: Biography
    let image: HeroImage
    let powerstats: PowerStats
    
    func toHero() -> Hero {
        Hero(id: id, name: name, fullName: biography.fullName, url: image.url, publisher: biography.publisher, placeOfBirth: biography.placeOfBirth, intelligence: Int(powerstats.intelligence) ?? 0, strength:  Int(powerstats.strength) ?? 0, speed:  Int(powerstats.speed) ?? 0, durability: Int(powerstats.durability) ?? 0, power: Int(powerstats.power) ?? 0, combat: Int(powerstats.combat) ?? 0)
    }
}

struct PowerStats: Decodable {
    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String
}

struct Biography: Decodable {
    let fullName: String
    let placeOfBirth: String
    let publisher: String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case placeOfBirth = "place-of-birth"
        case publisher
    }
}

struct HeroImage: Decodable {
    let url: String
}
