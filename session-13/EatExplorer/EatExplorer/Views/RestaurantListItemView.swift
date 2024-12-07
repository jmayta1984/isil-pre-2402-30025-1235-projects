//
//  RestaurantListItemView.swift
//  EatExplorer
//
//  Created by user272495 on 11/29/24.
//

import SwiftUI

struct RestaurantListItemView: View {
    let restaurant: Restaurant
    
    var body: some View {
        HStack(spacing: 10) {
            AsyncImage(
                url: URL(string: restaurant.poster),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))

                },
                placeholder: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 100, height: 100)
                        ProgressView()

                    }
                }
            )
            VStack (alignment: .leading){
                Text(restaurant.title).bold().foregroundStyle(Color.orange)
                Text(restaurant.address).lineLimit(2).font(.subheadline)

            }
        }
    }
}
