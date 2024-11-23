//
//  HttpRequestError.swift
//  MovieApp
//
//  Created by user272495 on 11/16/24.
//

enum HttpRequestError: Error {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case httpError(Int)
    case noData
    case decodingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "The URL is invalid."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "The response from the server was invalid."
        case .httpError(let statusCode):
            return "HTTP error with status code: \(statusCode)."
        case .noData:
            return "No data received from the server."
        case .decodingError(let error):
            return "Failed to decode the data: \(error.localizedDescription)"
        }
    }
}

