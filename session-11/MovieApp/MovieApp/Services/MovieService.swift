//
//  MovieService.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import Foundation


class MovieService {
    
    func getMovies(completion: @escaping ([Movie]?, String? ) -> Void) {
        let url = "https://api.themoviedb.org/3/movie/upcoming?api_key=3cae426b920b29ed2fb1c0749f258325"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion(nil, "Error: \(message ?? "no data")")
                    return
                }
                do {
                    let wrapper = try JSONDecoder().decode(MovieWrapper.self, from: data)
                    let movies = wrapper.results.map { movieResponse in
                        Mapper.toMovie(response: movieResponse)
                    }
                    completion(movies, nil)
                    
                } catch (let error){
                    completion(nil, "Error: \(error.localizedDescription)")
                }
                
            } else {
                completion(nil, "Error: \(message ?? "no response")")
            }
        }
        
    }
}
