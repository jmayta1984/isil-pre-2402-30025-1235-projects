//
//  CategoryListItem.swift
//  MealsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct CategoryListItem: View {
    let category: Category
    var body: some View {
        
        ZStack {
            VStack {
                AsyncImage(
                    url: URL(string: category.image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 256, height: 128)
                            .cornerRadius(8)
                        .clipped()} ,
                    placeholder: {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.gray.opacity(0.8))
                            .frame(width: 256, height: 128)
                    })
                .overlay(
                    
                    HStack {
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .fill(Color.gray.opacity(0.8))
                                .frame(width: 150, height: 24)
                            
                            Text(category.name).font(.subheadline).bold()
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        
                    },
                    alignment: .bottom
                )
            }.frame(maxWidth: .infinity, alignment: .center)
            
            
            
        }
        
        
        
    }
}

#Preview {
    CategoryListItem(category: Category(id: "1", name: "Beef", image: "https://www.themealdb.com/images/category/beef.png", description: "Beef is the culinary name for meat from cattle, particularly skeletal muscle. Humans have been eating beef since prehistoric times.[1] Beef is a source of high-quality protein and essential nutrients.[2]"))
}
