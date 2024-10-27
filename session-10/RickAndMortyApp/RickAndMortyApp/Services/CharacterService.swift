//
//  CharacterService.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

class CharacterService {
    
    private var url = "https://rickandmortyapi.com/api/character"
    
    func getAllCharacters(completion: @escaping ([Character]?, String?) -> Void ) {
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                do {
                    let wrapper = try JSONDecoder().decode(CharacterWrapper.self, from: data!)
                    let charactersResponse = wrapper.results
                    let characters = charactersResponse.map { characterResponse in
                        characterResponse.toCharacter()
                    }
                    completion(characters, nil)
                } catch (let error) {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message)
            }
        }
    }
    
}
