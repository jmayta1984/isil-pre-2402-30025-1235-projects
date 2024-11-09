//
//  MealListView.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct MealListView: View {
    let category: String
    @State private var meals:[Meal] = []
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            List {
                ForEach(meals) { meal in
                    MealListItem(meal: meal)
                }
            }.listStyle(PlainListStyle()).navigationTitle(category)
                
        }
        .onAppear {
            MealService().getMealsByCategory(category: category) { meals, message in
                if let meals = meals {
                    self.meals = meals
                }
            }
        }
    }
}

#Preview {
    MealListView(category: "Seafood")
}
