//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    init() {
        getMovies()
    }
    
    private func getMovies() {
        MovieService().getMovies { movies, message in
            if let movies = movies {
                self.movies = movies
            }
        }
    }
    
}

