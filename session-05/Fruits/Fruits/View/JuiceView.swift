//
//  ContentView.swift
//  Fruits
//
//  Created by user259661 on 10/4/24.
//

import SwiftUI

struct JuiceView: View {
    @State var fruit: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: {
                    FruitsView { fruit in
                        self.fruit = fruit
                    }
                    /* Binding */
                    // FruitsView(fruit: $fruit)
                }) {
                    Text("Choose a flavour")
                }
                Text(fruit).font(.largeTitle)
               
            }.navigationTitle("Order")
        }
    }
}

#Preview {
    JuiceView()
}
