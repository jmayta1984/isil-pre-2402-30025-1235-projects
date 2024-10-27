//
//  LoginRequest.swift
//  NewsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

struct LoginBody: Encodable {
    let username: String
    let password: String
}
