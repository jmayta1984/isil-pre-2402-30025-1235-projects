//
//  EpisodeListView.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import SwiftUI

struct EpisodeListView: View {
    
    @StateObject var viewModel = EpisodeListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.episodes){ episode in
                VStack(alignment: .leading) {
                    Text(episode.name)
                    Text(episode.episode)
                }
            }
        }.listStyle(PlainListStyle())
    }
}

#Preview {
    EpisodeListView()
}
