//
//  AuthService.swift
//  NewsApp
//
//  Created by user259661 on 10/27/24.
//

import Foundation

class AuthService {
    
    func login(body: LoginBody, completion: @escaping (LoginResponse?, String? ) -> Void) {
        
        let url = "https://dummyjson.com/auth/login"
        
        HttpRequestHelper().POST(url: url, body: body) { success, data, message in
            if (success) {
                guard let data = data else {
                    completion (nil, message ?? "Error: no data")
                    return
                }
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    completion(loginResponse,nil)
                    
                } catch let error {
                    completion(nil, error.localizedDescription)
                }
            } else {
                completion(nil, message ?? "Error: no response")
            }
        }
    }
    
}
