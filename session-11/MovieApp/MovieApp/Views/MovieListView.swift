//
//  MovieListView.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import SwiftUI

struct MovieListView: View {
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.movies) { movie in
                MovieListItemView(movie: movie)
            }
        }.listStyle(PlainListStyle())
    }
}

#Preview {
    MovieListView()
}
