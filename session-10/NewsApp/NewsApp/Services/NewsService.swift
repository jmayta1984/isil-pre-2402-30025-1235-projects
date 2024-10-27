//
//  NewsService.swift
//  NewsApp
//
//  Created by user259661 on 10/26/24.
//

import Foundation

class NewsService {
    
    func getNews(query: String, completion: @escaping ([News]?, String? ) -> Void) {
        let apiKey = "Your apikey here"
        let url = "https://newsapi.org/v2/everything?q=\(query)&apiKey=\(apiKey)"
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion (nil, message ?? "Error: no data")
                    return
                }
                do {
                    let wrapper = try JSONDecoder().decode(NewsWrapper.self, from: data)
                    let newsDto = wrapper.articles
                    let news = newsDto.map { dto in
                        Mapper.map(dto: dto)
                    }
                    completion(news,nil)
                    
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message ?? "Error: no response")
            }
        }
    }
}
