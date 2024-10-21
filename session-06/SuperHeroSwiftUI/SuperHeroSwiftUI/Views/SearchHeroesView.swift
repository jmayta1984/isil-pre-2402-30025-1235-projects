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
    
    func loadData()  {
        HeroService().getHeroesByName(name: name) { heroes in
            self.heroes = heroes
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black.ignoresSafeArea()
                   
                VStack (spacing: 0) {
                    TextField("Search hero", text: $name).padding().textFieldStyle(.roundedBorder).onSubmit {
                        loadData()
                    }
                    
                    List {
                        ForEach(heroes) { hero in
                            NavigationLink(destination: {HeroDetailView(hero: hero)}) {
                                HeroItemView(hero: hero)
                            }
                            
                        }.listRowBackground(Color.black)
                    }.listStyle(PlainListStyle())
                    
                    
                }
            }
        }
    }
}

#Preview {
    SearchHeroesView()
}
