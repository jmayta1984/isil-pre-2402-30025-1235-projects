//
//  CategoryListView.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct CategoryListView: View {
    @State private var categories: [Category] = []
    var body: some View {
        NavigationStack {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: {
                        MealListView(category: category.name)
                    }) {
                        CategoryListItem(category: category)
                    }
                }
            }.listStyle(PlainListStyle()).navigationTitle("Categories")
        }
        .onAppear{
            CategoryService().getAllCategories { categories, message in
                if let categories = categories {
                    self.categories = categories
                }
            }
        }
    }
}

#Preview {
    CategoryListView()
}
