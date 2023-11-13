//
//  Networking.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import Foundation
import Combine





struct Networking {
    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }

    func getHeroes() -> URLRequest{
        let urlString = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=182f1965b7b85d44b12945225e855bee&hash=30465a13526b5a1e20215eafecaead1e"
       
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = HTTPMethods.get
       
        
return request
       
    }
    
}
