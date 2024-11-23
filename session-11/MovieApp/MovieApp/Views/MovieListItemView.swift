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
        HStack(spacing: 16) {
            AsyncImage(
                url: URL(string: movie.posterPath),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                },
                placeholder: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 90, height: 90)
                        ProgressView()
                    }
                }
            )
            
            Text(movie.title)
                .font(.body)
                .lineLimit(1)
                .truncationMode(.tail)
            
        }
    }
}


