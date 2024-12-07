//
//  MovieListView.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Cargando películas...")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else if let errorMessage = viewModel.errorMessage {
                Text("Error: \(errorMessage)")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(viewModel.movies) { movie in
                        MovieListItemView(movie: movie)
                    }
                    if viewModel.isLoadingMore {
                        ProgressView()
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if viewModel.hasMoreMovies {
                        Color.clear
                            .onAppear {
                                viewModel.loadMoreMovies()
                            }
                    }
                }
                .animation(.easeInOut, value: viewModel.movies)
                .listStyle(PlainListStyle())
            }
        }
    }
}
