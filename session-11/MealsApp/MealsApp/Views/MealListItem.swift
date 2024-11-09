//
//  MealListItem.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct MealListItem: View {
    let meal: Meal
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: meal.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 92, height: 92)
                        .cornerRadius(8)
                    .clipped()} ,
                placeholder: {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.gray.opacity(0.8))
                        .frame(width: 92, height: 92)
                })
            Text(meal.name)
            
        }
    }
}

#Preview {
    MealListItem(meal: Meal(id: "1", name: "Baked", image: ""))
}
