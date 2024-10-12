//
//  SearchHeroesView.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import SwiftUI

struct SearchHeroesView: View {
    
    @State var name: String = ""
    
    @State var heroes: [Hero] = []
        
    var body: some View {
        VStack {
            TextField("Search hero", text: $name).padding().textFieldStyle(.roundedBorder)
            Button(action: {
                HeroService().getHeroesByName(name: name) { heroes in
                    self.heroes = heroes
                }
            }){
                Text("Search")
            }
            List(heroes) { hero in
                HeroItemView(hero: hero)
            }
        }
    }
}

#Preview {
    SearchHeroesView()
}
