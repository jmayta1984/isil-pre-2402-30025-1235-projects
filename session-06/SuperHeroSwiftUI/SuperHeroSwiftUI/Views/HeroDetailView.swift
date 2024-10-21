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
                // Imagen del héroe
                AsyncImage(url: URL(string: hero.url), content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height * 0.4)
                        .cornerRadius(16)
                        .padding(.top, 16)
                        .padding(.leading, 16)
                        .padding(.trailing, 16)
                        .clipped()
                }, placeholder: {
                    ProgressView().frame(width: width, height: height * 0.4)
                })
                
                // Información del héroe
                HStack {
                    VStack(alignment: .leading) {
                        Text(hero.name)
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(8)
                        Text("Full name: \(hero.fullName)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                        Text("Place of birth: \(hero.placeOfBirth)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                        Text("Publisher: \(hero.publisher)")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                    }
                    .padding(8)
                    Spacer()
                }
                
                // Powerstats
                VStack(alignment: .leading) {
                    Text("Powerstats")
                        .bold()
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(8)
                    
                    PowerstatView(statName: "Intelligence", statValue: Double(hero.intelligence), width: width)
                    PowerstatView(statName: "Strength", statValue: Double(hero.strength), width: width)
                    PowerstatView(statName: "Speed", statValue: Double(hero.speed), width: width)
                    PowerstatView(statName: "Durability", statValue: Double(hero.durability), width: width)
                    PowerstatView(statName: "Power", statValue: Double(hero.power), width: width)
                    PowerstatView(statName: "Combat", statValue: Double(hero.combat), width: width)
                    
                }
                .padding(8)
            }
        }
        .background(Color.black) // Fondo negro para todo el ScrollView
        .toolbarBackground(Color.black, for: .navigationBar)
        // Fondo negro para la barra de navegación
    }
}

struct PowerstatView: View {
    let statName: String
    let statValue: Double
    let width: CGFloat
    
    var body: some View {
        HStack {
            Text(statName)
                .foregroundColor(.white)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 0))
            Spacer()
            Slider(value: Binding(get: { return statValue }, set: { _ in }), in: 0...100)
                .disabled(true)
                .padding(EdgeInsets(top: 0, leading: 8, bottom: 8, trailing: 8))
                .frame(width: width * 0.65)
        }
    }
}

#Preview {
    HeroDetailView(hero: Hero(id: "69", name: "Batman", fullName: "Terry McGinnis", url: "https://www.superherodb.com/pictures2/portraits/10/100/10441.jpg", publisher: "Marvel", placeOfBirth: "New York", intelligence: 50, strength: 70, speed: 70, durability: 89, power: 89, combat: 85))
}
