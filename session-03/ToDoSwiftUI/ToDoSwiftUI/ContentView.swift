//
//  ContentView.swift
//  ToDoSwiftUI
//
//  Created by user259661 on 9/20/24.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    var body: some View {
        NavigationView {
            VStack {
                
                TextField("Ingrese nombre", text: $name)
                NavigationLink(destination: {
                    GreetingView(text: name)
                }) {
                   Text("Say hi")
                }
            }
            .padding()
        }
        
    }
}

struct GreetingView: View {
    var text: String
    var body: some View {
        VStack {
            Text("Hi \(text)")
        }
    }
}


#Preview {
    ContentView()
}
