//
//  MovieListItemView.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import SwiftUI

struct MovieListItemView: View {
    let movie: Movie
    
    var body: some View {
        
        HStack {
            AsyncImage(
                url: URL(string: movie.posterPath), content: { image in
                    image.resizable().aspectRatio(contentMode: .fill).frame(width: 90, height: 90).clipShape(RoundedRectangle(cornerRadius: 10))
                    
                }, placeholder: { ProgressView()})
            Text(movie.title)
        }
        
    }
}

