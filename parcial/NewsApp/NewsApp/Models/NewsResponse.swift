//
//  NewsDto.swift
//  NewsApp
//
//  Created by user259661 on 10/26/24.
//

import Foundation

struct NewsWrapper: Decodable {
    let articles: [NewsResponse]
}
struct NewsResponse:Decodable {
    let author: String?
    let title: String?
    let description: String?
}

struct News: Identifiable {
    let id: UUID = UUID()
    let author: String
    let title: String
    let description: String
}

struct Mapper {
    static func map(dto: NewsResponse) -> News {
        return News(author: dto.author ?? "", title: dto.title ?? "", description: dto.description ?? "")
    }
}
