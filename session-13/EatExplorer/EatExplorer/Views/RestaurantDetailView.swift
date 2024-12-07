//
//  RestaurantDetailView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State private var showDetail = false

    let restaurant: Restaurant
    var onSave: () -> Void
    
       
        
    var body: some View {
        VStack {

            AsyncImage(
                url: URL(string: restaurant.poster),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: nil, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                },
                placeholder:  {
                }
            )
            
            Image(systemName: "heart").onTapGesture {
                onSave()
            }
            Text(restaurant.description)
            Spacer()
            Button("Show Credits") {
                showDetail.toggle()
                   }.sheet(isPresented: $showDetail) {
                       GoogleMapView(restaurant: restaurant)

                           .presentationDetents([.medium, .large])
                          // .presentationDragIndicator(.hidden)
                           
                   }
        }
            
        
    }
}
