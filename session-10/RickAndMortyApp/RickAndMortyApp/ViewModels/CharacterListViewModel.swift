//
//  CharacterListViewModel.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var message: String = ""
        
    init() {
        getAllCharacters()
    }
    
    private func getAllCharacters() {
        CharacterService().getAllCharacters { newCharacters, newMessage in
            guard newMessage == nil else {
                self.message = newMessage!
                return
            }
            
            guard let newCharacters = newCharacters else {
                return
            }
            self.characters = newCharacters
         }
    }
}
