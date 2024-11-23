//
//  SprintAnimationView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct SpringAnimationView: View {
    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        VStack {
            Circle().fill(Color.blue).frame(width: 100, height: 100)
                .scaleEffect(scale)
                .animation(.spring(response: 0.5, dampingFraction: 0.3, blendDuration: 0), value: scale)
            Button("Spring animation") {
                scale = scale == 1.0 ? 1.5 : 1.0
            }.padding()
        }
    }
}

#Preview {
    SprintAnimationView()
}
