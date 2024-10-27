//
//  CharacterListItem.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import SwiftUI

struct CharacterListItem: View {
    let character: Character
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: character.image), content: { image in
                image.resizable().aspectRatio(contentMode: .fill).frame(width: 64, height:64).cornerRadius(8).clipped()} , placeholder: { RoundedRectangle(cornerRadius: 8).frame(width: 64, height: 64) })
            VStack(alignment: .leading) {
                Text(character.name).bold()
                Text(character.status)
            }
            
        }
    }
}

#Preview {
    CharacterListItem(character: Character(id: 1, name: "Rick", status: "Alive", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg" ))
}
