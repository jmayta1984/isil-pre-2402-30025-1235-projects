//
//  MoviesView.swift
//  MovieApp
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct MoviesView: View {
    @State private var search = ""
    @StateObject var viewModel = MovieListViewModel()
    
    init() {
        // Large Navigation Title
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.orange]
        
    }
    var body: some View {
        NavigationStack {
            VStack {
               
                
                HStack {
                    Image(systemName: "magnifyingglass").foregroundStyle(Color.gray)
                    TextField("Search any movies", text: $search)
                }.padding()
                ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack {
                        ForEach(APIEndpoint.allCases, id: \.self) { endpoint in
                            ZStack {
                                
                                Text(endpoint.displayName)
                                    .font(.subheadline)
                                    .foregroundStyle((viewModel.endpoint == endpoint) ? Color.orange : Color.white )
                                    .padding([.leading, .trailing]).onTapGesture {
                                        viewModel.updateEndpoint(endpoint: endpoint)
                                    }
                            }
                            
                        }
                    }.fixedSize()
                }
               
                MovieListView(viewModel: viewModel)
            }
            .navigationTitle(viewModel.endpoint.displayName)
            
            
            
            
            
        }
    }
}

#Preview {
    MoviesView().preferredColorScheme(.dark)
}
