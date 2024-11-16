//
//  MovieResponse.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

struct MovieWrapper: Decodable {
    let results: [MovieResponse]
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
