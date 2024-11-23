//
//  RotationAnimationView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct RotationAnimationView: View {
    @State private var rotation: Double = 0
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.yellow)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
                .animation(.linear(duration: 1.0), value: rotation)
            Button("Rotate"){
                rotation += 45
            }.padding()
        }
    }
}

#Preview {
    RotationAnimationView()
}
