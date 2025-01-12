//
//  Networking.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import Foundation



struct BaseNetwork {
    
    func getHeroes(sortBy orderMethod: OrderBy) -> URLRequest{
        let auth = "?ts=\(Server.ts.rawValue)&apikey=\(Server.apiKey.rawValue)&hash=\(Server.hash1.rawValue)"
        let sortBy = "&orderBy=\(orderMethod.rawValue)"
        let urlString = "\(Endpoints.baseURL1.rawValue)\(Endpoints.heroes.rawValue)\(auth)\(sortBy)"
        
        let url = URL(string: urlString)
        
        // Request
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
    }
    
    func getMarvelSeries(with heroId: Int, sortBy orderMethod: OrderBy) -> URLRequest {
        let auth = "?ts=\(Server.ts.rawValue)&apikey=\(Server.apiKey.rawValue)&hash=\(Server.hash1.rawValue)"
        let urlString = "\(Endpoints.baseURL1.rawValue)/characters/\(heroId)/series\(auth)"
        
        let url = URL(string: urlString)
        
        // Request
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
    }
}







