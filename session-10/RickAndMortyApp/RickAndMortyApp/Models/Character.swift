//
//  Character.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

struct CharacterWrapper: Decodable {
    let results: [CharacterResponse]
}

struct CharacterResponse: Decodable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let gender: String
    let image: String
    let type: String
    
    func toCharacter() -> Character {
        Character(id: self.id, name: self.name, status: self.status, image: self.image)
    }
}

struct Character: Identifiable {
    let id: Int
    let name: String
    let status: String
    let image: String
}
