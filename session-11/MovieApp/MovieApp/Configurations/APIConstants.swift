//
//  APIConstants.swift
//  MovieApp
//
//  Created by user272495 on 11/16/24.
//

import Foundation

struct APIConstants {
    // Base URL de la API
    static let baseURL = "https://api.themoviedb.org/3"
    
    // Clave de API
    //static let apiKey = "YOUR_API_KEY_HERE"
    static let apiKey = "3cae426b920b29ed2fb1c0749f258325"


    // Endpoints específicos
    struct Endpoints {
        static let upcomingMovies = "/movie/upcoming"
        static let popularMovies = "/movie/popular"
        static let topRatedMovies = "/movie/top_rated"
        static let nowPlayingMovies = "/movie/now_playing"

    }
    
    // Parámetros comunes
    struct Parameters {
        static let apiKey = "api_key"
        static let page = "page"
    }
}

