//
//  LoginResponse.swift
//  NewsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

struct LoginResponse: Decodable {
    let id: Int
    let username: String
    let firstName: String
    let lastName: String
    let accessToken: String
}

