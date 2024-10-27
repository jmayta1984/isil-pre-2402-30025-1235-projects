//
//  EpisodeListViewModel.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

class EpisodeListViewModel: ObservableObject {
    @Published var episodes:[Episode] = []
    @Published var message: String = ""
    
    
    init() {
        getAllEpisodes()
    }
    
    private func getAllEpisodes() {
        EpisodeService().getAllEpisodes { newEpisodes, newMessage in
            guard newMessage == nil else {
                self.message = newMessage!
                return
            }
            guard let newEpisodes = newEpisodes  else
            {
                return
            }
            self.episodes = newEpisodes
        }
    }
}
