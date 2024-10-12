//
//  HeroItemView.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import SwiftUI

struct HeroItemView: View {
    var hero: Hero
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.url), content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:96, height: 96)
                    .clipped()

            }, placeholder: {ProgressView()})
            
            VStack(alignment: .leading){
                Text(hero.name)
                Text(hero.fullName)
                
            }
            Spacer()
            Button(action: {}){
                Image(systemName: "heart")
            }
        }
    }
}

#Preview {
    HeroItemView(hero: Hero(id: "69", name: "Batman", fullName: "Terry McGinnis", url: "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg"))
}
