//
//  HttpRequestHelper.swift
//  MovieApp
//
//  Created by user272495 on 11/15/24.
//

import Foundation

class HttpRequestHelper {
    
    func GET(url: String, completion: @escaping (Result<Data, HttpRequestError>) -> Void) {
           guard let url = URL(string: url) else {
               completion(.failure(.invalidURL))
               return
           }
           
           var urlRequest = URLRequest(url: url)
           urlRequest.httpMethod = "GET"
           
           let session = URLSession.shared
           session.dataTask(with: urlRequest) { data, response, error in
               
               // Manejo de errores de conexión
               if let error = error {
                   completion(.failure(.networkError(error)))
                   return
               }
               
               // Validación de la respuesta HTTP
               guard let response = response as? HTTPURLResponse else {
                   completion(.failure(.invalidResponse))
                   return
               }
               
               // Manejo de códigos de estado HTTP
               guard (200...299).contains(response.statusCode) else {
                   completion(.failure(.httpError(response.statusCode)))
                   return
               }
               
               // Validación de datos
               guard let data = data else {
                   completion(.failure(.noData))
                   return
               }
               
               // Todo está bien, devolver los datos
               completion(.success(data))
           }.resume()
       }
    
    func POST<T: Encodable>(url: String, body: T, completion: @escaping(Bool, Data?, String?) -> Void){
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            completion(false, nil, "Error: cannot create URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            urlRequest.httpBody = jsonData
        } catch let encodingError {
            completion(false, nil, encodingError.localizedDescription)
            return
        }
        
        let session = URLSession.shared
        session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                print("Error: problem calling POST")
                completion(false, nil, "Error: problem calling POST")
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
