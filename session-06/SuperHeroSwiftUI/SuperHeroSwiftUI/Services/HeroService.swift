//
//  HeroService.swift
//  SuperHeroSwiftUI
//
//  Created by user259661 on 10/11/24.
//

import Foundation

class HeroService {
    private var url = "https://www.superheroapi.com/api.php/f274286a22873ec9fc7a5782940f7ca2/search/"
    
    func getHeroesByName(name: String, completion: @escaping ([Hero]) -> Void){
        url += name
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success {
                do {
                    let wrapper = try JSONDecoder().decode(ResponseWrapper.self, from: data!)
                    let heroes = wrapper.results.map { heroResponse in
                    heroResponse.toHero()
                    }
                    completion(heroes)
                } catch {
                    
                }
            }
        }
    }
}
