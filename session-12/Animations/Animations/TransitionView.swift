//
//  TransitionView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct TransitionView: View {
    @State private var showRectangle = false
    
    var body: some View {
        VStack {
            if showRectangle {
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 100, height: 100)
                    .transition(.scale)
            }
            
            Button("Toggle") {
                withAnimation {
                    showRectangle.toggle()
                }
            }.padding()
        }
    }
}

#Preview {
    TransitionView()
}
