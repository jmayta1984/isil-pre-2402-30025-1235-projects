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
    
    @Published var endpoint = APIEndpoint.popular

    
    private let movieService = MovieService()
    private var currentPage = 1
    private let resultsPerPage = 20 // Número de resultados por página
    private var isLastPage = false // Indica si ya se alcanzó la última página
    
 
    
    var hasMoreMovies: Bool {
        !isLastPage
    }
    
    func updateEndpoint(endpoint: APIEndpoint){
        self.endpoint = endpoint
        self.movies = []
        self.errorMessage = nil
        self.isLoading = false
        self.isLoadingMore = false
        self.currentPage = 1
        getMovies()
        
    }
    
    func getMovies() {
        guard !isLoading else { return }
        isLoading = true
        errorMessage = nil
        
        movieService.getMovies(endpoint: endpoint.rawValue, page: currentPage) { result in
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
        
        movieService.getMovies(endpoint: endpoint.rawValue, page: currentPage + 1) { result in
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



