//
//  CharacterListView.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import SwiftUI

struct CharacterListView: View {
    @StateObject var viewModel = CharacterListViewModel()
 
    var body: some View {
        HStack {
            if (!viewModel.message.isEmpty ){
                Text(viewModel.message)
            } else {
                List {
                    ForEach(viewModel.characters) { character in
                        CharacterListItem(character: character)
                    }
                    
                }.listStyle(PlainListStyle())
            }
            
        }
        
    }
}

#Preview {
    CharacterListView()
}
