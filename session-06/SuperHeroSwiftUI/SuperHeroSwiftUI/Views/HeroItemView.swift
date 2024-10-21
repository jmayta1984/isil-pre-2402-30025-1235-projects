//
//  HeroItemView.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import SwiftUI

struct HeroItemView: View {
    var hero: Hero
    @State var isFavorite: Bool = false
    
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string: hero.url), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:64, height: 64)
                    .cornerRadius(8)
                    .clipped()
                
            }, placeholder: { ProgressView().frame(width:64, height: 64)})
            
            VStack(alignment: .leading){
                Text(hero.name).foregroundStyle(.white).font(.title3).bold()
                Text(hero.fullName).foregroundStyle(.white)
                
            }
            Spacer()
            Button(action: {
                isFavorite.toggle()
            }){
                
                Image(systemName: isFavorite ? "heart.fill" :"heart" ).foregroundColor(.white)
                
            }.buttonStyle(BorderlessButtonStyle())
            
            
        }.padding(.vertical,4).background(Color.black) // Fondo negro para cada celda
            
    }
    
    
    
}

#Preview {
    HeroItemView(hero: Hero(id: "69", name: "Batman", fullName: "Terry McGinnis", url: "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg", publisher: "Marvel", placeOfBirth: "New York", intelligence: 50, strength: 70, speed: 80, durability: 89, power: 89, combat: 85))
}
