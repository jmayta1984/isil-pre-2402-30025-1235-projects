//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CharacterListView().tabItem {
                Label("Characters", systemImage: "plus")
            }
            EpisodeListView().tabItem {
                Label("Episodes", systemImage: "plus")
            }

        }
    }
}

#Preview {
    ContentView()
}
