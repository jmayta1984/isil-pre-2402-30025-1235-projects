//
//  HeroDetailView.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/18/24.
//

import SwiftUI

struct HeroDetailView: View {
    let hero: Hero
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: hero.url), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:width, height: height*0.4)
                        .clipped()
                    
                }, placeholder: {ProgressView()})
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius:16).fill(.quinary)
                    VStack(alignment: .leading) {
                        Text(hero.name).bold().font(.title).padding(8)
                        Text("Full name: \(hero.fullName)").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                        Text("Place of birth: \(hero.placeOfBirth)").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                        Text("Publisher: \(hero.publisher)").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                        
                    }
                    
                }.fixedSize(horizontal: false, vertical: true).padding(8)
                ZStack(alignment: .leading){
                    RoundedRectangle(cornerRadius:16).fill(.quinary)
                    VStack(alignment: .leading) {
                        Text("Powerstats").bold().font(.title).padding(8)
                        HStack  {
                            Text("Intelligence").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 0))
                            Spacer()
                            Slider(value: Binding(get: {return Double(hero.intelligence)}, set: { _ in }), in: 0...100).disabled(false).padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)).frame(width: width*0.65)
                        }
                        HStack  {
                            Text("Strength").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 0))
                            Spacer()
                            Slider(value: Binding(get: {return Double(hero.strength)}, set: { _ in }), in: 0...100).disabled(false).padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)).frame(width: width*0.65)
                        }
                        HStack  {
                            Text("Speed").padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 0))
                            Spacer()
                            Slider(value: Binding(get: {return Double(hero.speed)}, set: { _ in }), in: 0...100).disabled(false).padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8)).frame(width: width*0.65)
                        }
                                   
                    
                        
                    }
                    
                }.fixedSize(horizontal: false, vertical: true).padding(8)
                Spacer()
            }
        }
    }
}

#Preview {
    HeroDetailView(hero: Hero(id: "69", name: "Batman", fullName: "Terry McGinnis", url: "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg", publisher: "Marvel", placeOfBirth: "New York", intelligence: 50, strength: 70, speed: 70, durability: 89, power: 89, combat: 85))
}
