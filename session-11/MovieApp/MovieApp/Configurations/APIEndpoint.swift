//
//  Sections.swift
//  MovieApp
//
//  Created by DAMII on 26/11/24.
//

import Foundation

enum MovieAPIEndpoint: String, CaseIterable {
    case topRated = "/movie/top_rated"
    case popular = "/movie/popular"
    case upcoming = "/movie/upcoming"
    case nowPlaying = "/movie/now_playing"
    
    var displayName: String {
        switch self {
        case .topRated:
            return "Top Rated"
        case .popular:
            return "Popular"
        case .upcoming:
            return "Upcoming"
        case .nowPlaying:
            return "Now Playing"
        }
    }
}
