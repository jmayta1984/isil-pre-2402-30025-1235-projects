//
//  MoviesView.swift
//  MovieApp
//
//  Created by DAMII on 26/11/24.
//

import SwiftUI

struct MoviesView: View {
    @State private var search = ""
    @State private var index = Sections.popular
    
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
                        ForEach(Sections.allCases, id: \.self) { section in
                            Text(section.rawValue)
                                .font(.subheadline)
                                .foregroundStyle((index == section) ? Color.orange : Color.white )
                                .padding([.leading, .trailing]).onTapGesture {
                                    index = section
                                }
                        }
                    }.fixedSize()
                }
               
                MovieListView()
            }
            .navigationTitle(index.rawValue)
            
            
            
            
            
        }
    }
}

#Preview {
    MoviesView().preferredColorScheme(.dark)
}
