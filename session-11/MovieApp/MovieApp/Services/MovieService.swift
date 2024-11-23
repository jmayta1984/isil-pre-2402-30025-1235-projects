//
//  MovieService.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import Foundation


class MovieService {
    func getMovies(page: Int, completion: @escaping (Result<[Movie], HttpRequestError>) -> Void) {
        let url = "\(APIConstants.baseURL)\(APIConstants.Endpoints.popularMovies)?\(APIConstants.Parameters.apiKey)=\(APIConstants.apiKey)&\(APIConstants.Parameters.page)=\(page)"
        print(url)
        
        HttpRequestHelper().GET(url: url) { result in
            switch result {
            case .success(let data):
                do {
                    let wrapper = try JSONDecoder().decode(MovieWrapper.self, from: data)
                    completion(.success(wrapper.results.map { movieRespone in
                        Mapper.toMovie(response: movieRespone ) }))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

