//
//  Networking.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import Foundation
import Combine

struct BaseNetwork {
    
    func getHeroes(sortBy orderMethod: OrderBy) -> URLRequest{
        let auth = "?ts=\(Server.ts.rawValue)&apikey=\(Server.apiKey.rawValue)&hash=\(Server.hash1.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "\(Endpoints.baseURL1.rawValue)\(Endpoints.heroes.rawValue)\(auth)\(sortBy)"
        
        let url = URL(string: urlString)
        
        // Requuest
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
    }
    
    func getMarvelSeries(with heroId: Int,sortBy orderMethod: OrderBy) -> URLRequest{
        
        let auth = "?ts=\(Server.ts)&apikey=\(Server.apiKey)&hash=\(Server.hash1)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "https://gateway.marvel.com:443/v1/public/characters/\(heroId)/series?ts=1&apikey=182f1965b7b85d44b12945225e855bee&hash=30465a13526b5a1e20215eafecaead1e"
        
        /*"\(Endpoints.baseURL1.rawValue)\(Endpoints.heroes.rawValue)/\(heroId)\(Endpoints.series.rawValue)\(auth)\(sortBy)" // probar*/
                
        let url = URL(string: urlString)
                
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
        
    }
    
   
}







