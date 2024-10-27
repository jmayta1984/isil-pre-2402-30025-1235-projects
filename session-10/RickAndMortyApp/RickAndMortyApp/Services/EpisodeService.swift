//
//  EpisodeService.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

class EpisodeService {
    
    private var url = "https://rickandmortyapi.com/api/episode"
    
    func getAllEpisodes(completion: @escaping ([Episode]?, String?) -> Void ) {
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                do {
                    let wrapper = try JSONDecoder().decode(EpisodeWrapper.self, from: data!)
                    let episodesResponse = wrapper.results
                    let episodes = episodesResponse.map { episodeResponse in
                        episodeResponse.toEpisode()
                    }
                    completion(episodes, nil)
                } catch (let error) {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message)
            }
        }
    }
    
}
