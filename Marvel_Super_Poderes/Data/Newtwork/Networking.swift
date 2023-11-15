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
        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-Type")
        return request
       
        

       
    }
    
    func getHeroesFake() -> [HeroesMarvel] {
        let hero1 = HeroesMarvel(
            id: 1011334,
            name: "3-D Man",
            description: "",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
            )
        )

        
        let hero2 = HeroesMarvel(id: 1017100,
                                 name: "A-Bomb (HAS)",
                                 description: "Rick Jones has been Hulk's best bud since day one, but now he's more than a friend...he's a teammate! Transformed by a Gamma energy explosion, A-Bomb's thick, armored skin is just as strong and powerful as it is blue. And when he curls into action, he uses it like a giant bowling ball of destruction! ",
                                
                                 thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: "jpg"))
        
        let hero3 = HeroesMarvel(id: 1009144,
                                 name: "A.I.M.",
                                 description: "AIM is a terrorist organization bent on destroying the world.",
                                 thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/20/52602f21f29ec", thumbnailExtension: "jpg"))
                                 
                                 
        return [hero1, hero2, hero3]
    }
    
}
