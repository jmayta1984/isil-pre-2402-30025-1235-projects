//
//  SwiftUIView.swift
//  Fruits
//
//  Created by user259661 on 10/4/24.
//

import SwiftUI


struct FruitsView: View {
    @Environment(\.dismiss) var dismiss
   
    /* Binding */
    // @Binding var fruit: String
    
    var onPressedFruit: (String) -> Void
       
    let fruits = ["🍊", "🍓", "🍌", "🍇"]
    
    var body: some View {
        HStack {
            ForEach(fruits, id: \.self) { fruit in
                Button(action: {
                    /* Binding */
                    // self.fruit = fruit
                    onPressedFruit(fruit)
                    dismiss()
                } ){
                    Text(fruit).font(.largeTitle).padding()
                }
                
            }
        }
    }
}

#Preview {
    FruitsView { _ in
        
    }
    /* Binding */
    //FruitsView(fruit: .constant(""))
}
