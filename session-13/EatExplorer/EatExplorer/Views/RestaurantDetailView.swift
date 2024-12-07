//
//  RestaurantDetailView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State private var showMap = false
    
    let restaurant: Restaurant
    
    @StateObject var viewModel = RestaurantDetailViewModel()
    
    var body: some View {
        VStack {
            
            AsyncImage(
                url: URL(string: restaurant.poster),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: nil, height: 400)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                },
                placeholder:  {
                }
            )
            
            Image(systemName: viewModel.isFavorite ?
                  "heart.fill" : "heart").padding().foregroundStyle(.orange).onTapGesture {
                viewModel.isFavoriteToggle(restaurant: restaurant)
            }
            Text(restaurant.description)
            Spacer()
            Button("Show map") {
                showMap.toggle()
            }.sheet(isPresented: $showMap) {
                GoogleMapView(restaurant: restaurant)
                    .presentationDetents([.medium, .large])
            }
        }.onAppear {
            viewModel.checkFavorite(restaurant: restaurant)
        }
        
        
    }
}
