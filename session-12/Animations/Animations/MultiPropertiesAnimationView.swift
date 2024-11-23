//
//  MultiPropertiesAnimationView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct MultiPropertiesAnimationView: View {
    @State private var change = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: change ? 50 : 0)
                .fill( change ? Color.green : Color.yellow)
                .frame(width: change ? 200 : 100,
                       height: change ? 200 : 100 )
                .rotationEffect(.degrees( change ? 45 : 0 ))
                .animation(.easeInOut, value: change)
            Button("Animate"){
                change.toggle()
            }.padding()
        }
    }
}

#Preview {
    MultiPropertiesAnimationView()
}
