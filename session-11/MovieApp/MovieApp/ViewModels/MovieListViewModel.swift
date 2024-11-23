//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    @Published var isLoadingMore: Bool = false // Indica si se están cargando más películas
    
    private let movieService = MovieService()
    private var currentPage = 1
    private let resultsPerPage = 20 // Número de resultados por página
    private var isLastPage = false // Indica si ya se alcanzó la última página
    
    init() {
        getMovies()
    }
    
    var hasMoreMovies: Bool {
        !isLastPage
    }
    
    func getMovies() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        movieService.getMovies(page: currentPage) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                case .success(let movies):
                    self.movies.append(contentsOf: movies)
                    self.isLastPage = movies.count < self.resultsPerPage // Última página si hay menos de 20 resultados
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func loadMoreMovies() {
        guard !isLoadingMore, !isLastPage else { return } // No cargar más si ya es la última página
        isLoadingMore = true
        
        movieService.getMovies(page: currentPage + 1) { result in
            DispatchQueue.main.async {
                self.isLoadingMore = false
                
                switch result {
                case .success(let movies):
                    self.currentPage += 1
                    self.movies.append(contentsOf: movies)
                    self.isLastPage = movies.count < self.resultsPerPage // Actualizar si es la última página
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}



