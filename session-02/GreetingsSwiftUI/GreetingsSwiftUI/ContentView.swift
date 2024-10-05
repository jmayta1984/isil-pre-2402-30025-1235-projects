//
//  ContentView.swift
//  GreetingsSwiftUI
//
//  Created by user259661 on 9/13/24.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var name: String = ""
    @State private var greeting: String = ""
    
    var body: some View {
        VStack {
            TextField("Escribe tu nombre", text: $name ).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                greeting = name
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            }).buttonStyle(.bordered)
            Text("Hi \(greeting)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
