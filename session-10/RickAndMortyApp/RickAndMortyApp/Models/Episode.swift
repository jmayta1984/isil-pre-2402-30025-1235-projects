//
//  Episode.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation


struct EpisodeWrapper: Decodable {
    let results: [EpisodeResponse]
}

struct EpisodeResponse: Decodable {
    let id: Int
    let name: String
    let episode: String
    let airDate: String
    let characters: [String]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case episode
        case airDate = "air_date"
        case characters
    }
    
    func toEpisode() -> Episode {
        return Episode(id: self.id, name: self.name, episode: self.episode)
    }
}

struct Episode: Identifiable {
    let id: Int
    let name: String
    let episode: String
}
