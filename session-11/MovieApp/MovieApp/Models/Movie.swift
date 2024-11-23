//
//  Movie.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

struct Movie: Identifiable, Equatable {
    let id: Int
    let title: String
    let posterPath: String
    let releaseDate: String
    let voteAverage: Double
}
