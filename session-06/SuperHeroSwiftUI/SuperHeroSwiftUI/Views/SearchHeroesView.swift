//
//  SearchHeroesView.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import SwiftUI

struct SearchHeroesView: View {
    
    @State var name: String = "batman"
    
    @State var heroes: [Hero] = []
    
    func loadData()  {
        HeroService().getHeroesByName(name: name) { heroes in
            self.heroes = heroes
        }
    }
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Search hero", text: $name).padding().textFieldStyle(.roundedBorder)
                Button(action: {
                    loadData()
                }){
                    Text("Search")
                }
                List {
                    ForEach(heroes) { hero in
                        HeroItemView(hero: hero)
                    }
                }
            }
        }
        .onAppear{
            loadData()
        }
    }
}

#Preview {
    SearchHeroesView()
}
