//
//  Mapper.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

struct Mapper {
    
    static func toMovie(response: MovieResponse) -> Movie {
        return Movie(id: response.id, title: response.title, posterPath: "https://image.tmdb.org/t/p/w500" + response.posterPath, releaseDate: response.releaseDate, voteAverage: response.voteAverage, overview: response.overview
        )
    }
}
