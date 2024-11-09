//
//  NewsListView.swift
//  NewsApp
//
//  Created by user259661 on 10/27/24.
//

import SwiftUI

struct NewsListView: View {
    
    @State var news:[News] = []
    @State var query: String = ""
    @State var message: String = ""

    
    func getNews() -> Void {
        NewsService().getNews(query: query) { news, message in
            guard message == nil else {
                self.message = message ?? ""
                self.news = []
                return
            }
            guard let news = news else {
                self.message = ""
                return
            }
            self.news = news
            
        }
    }
    var body: some View {
        VStack {
            TextField("Search news", text: $query , onCommit: {
                getNews()
            }).padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
            if !message.isEmpty {
               Text(message)
            }
            
            List {
                ForEach(news){ news in
                    Text(news.title)
                }
            }.listStyle(PlainListStyle())
        }.padding()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NewsListView()
}
