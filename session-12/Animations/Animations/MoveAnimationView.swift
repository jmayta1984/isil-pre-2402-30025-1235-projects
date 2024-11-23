//
//  MoveAnimationView.swift
//  Animations
//
//  Created by user272495 on 11/22/24.
//

import SwiftUI

struct MoveAnimationView: View {
    @State private var offset = 0.0
    var body: some View {
        VStack {
            Rectangle().fill(Color.purple).frame(width: 100, height: 100).offset(x: offset).animation(.bouncy, value: offset)
            Button("Move") {
                offset = offset == 0 ? 100 : 0
            }.padding()
        }
    }
}

#Preview {
    MoveAnimationView()
}
