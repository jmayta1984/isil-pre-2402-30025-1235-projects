//
//  FavoriteListView.swift
//  EatExplorer
//
//  Created by user272495 on 12/6/24.
//

import SwiftUI

struct FavoriteListView: View {
    @StateObject var viewModel = FavoriteListViewModel()
    var body: some View {
        List {
            ForEach(viewModel.favorites) { favorite in
                Text(favorite.title)
            }
        }.onAppear {
            viewModel.getAllFavorites()
        }
    }
}

#Preview {
    FavoriteListView()
}
