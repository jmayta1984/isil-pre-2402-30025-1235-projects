//
//  HttpRequestHelper.swift
//  RickAndMortyApp
//
//  Created by user259661 on 10/25/24.
//

import Foundation

class HttpRequestHelper {
    
    func GET(url: String, completion: @escaping (Bool, Data?, String?) -> Void ) {
        guard let url = URL(string: url) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                completion(false, nil, "Error: problem calling GET")
                return
            }
            guard let data = data else {
                print("Error: no data")
                completion(false, nil, "Error: no data")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                completion(false, data,"Error: HTTP request failed" )
                return
            }
            completion(true, data, nil)
        }.resume()
        
    }
}
