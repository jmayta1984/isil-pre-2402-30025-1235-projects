//
//  OpacityAnimationView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct OpacityAnimationView: View {
    
    @State private var isVisible = true
    
    var body: some View {
        VStack {
            Circle()
                .fill(Color.blue)
                .frame(width: 100, height: 100)
                .opacity(isVisible ? 1: 0)
                .animation(.easeInOut(duration: 1), value: isVisible)
            Button("Toogle opacity") {
                isVisible.toggle()
            }.padding()
            
        }
    }
}

#Preview {
    OpacityAnimationView()
}
