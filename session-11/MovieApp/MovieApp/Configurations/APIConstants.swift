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

    // Parámetros comunes
    struct Parameters {
        static let apiKey = "api_key"
        static let page = "page"
    }
}

