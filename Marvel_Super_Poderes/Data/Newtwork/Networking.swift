//
//  Networking.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import Foundation
import Combine

struct Networking {
    
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
        
        print(urlString)
        
        let url = URL(string: urlString)
        
        //Request
        var request = URLRequest(url: url!)
        request.httpMethod = HTTPMethods.get.rawValue
        
        return request
        
    }
    
    
    func getHeroesFake() -> [HeroesMarvel] {
        
        let hero1 = HeroesMarvel(id: 1011495, name: "Marvelman", description: "No me conocen ni en mi casa", modified: "2022-05-03T11:41:04-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        
        let hero2 = HeroesMarvel(id: 1017857, name: "Peggy Carter (Captain Carter)", description: "Soy man, MarvelMan", modified: "2023-09-14T12:40:07-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        
        let hero3 = HeroesMarvel(id: 1011442, name: "Hit-Monkey", description: "El mono saltarín", modified: "2022-04-14T19:56:30-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"))
        
        
        return [hero1, hero2, hero3]
        
        
    }
    
    func getSeriesFake() -> [SeriesMarvel] {
        
        let serie1 = SeriesMarvel(id: 17765, title: "FREE COMIC BOOK DAY 2013 1 (2013)", description: "FreeCommic", modified: "2019-09-23T20:59:37-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        
        let serie2 = SeriesMarvel(id: 3374, title: "Hulk (2008 - 2012)", description: "General Thunderbolt Ross spent years hunting the Hulk, but now he's become one himself! As the rampaging Red Hulk, Ross strives to reconcile the man he used to be with the monster he's becomes, smashing anything that moves along the way!", modified:"2020-09-04T09:03:42-0400", thumbnail: Thumbnail(path:"http://gateway.marvel.com/v1/public/series/3374", thumbnailExtension: "jpg"))
        
        let serie3 = SeriesMarvel(id: 374, title: "Hulk ", description: "La Serie", modified:"2020-09-04T09:03:42-0400", thumbnail: Thumbnail(path:"", thumbnailExtension: "jpg"))
        
        
        return [serie1,serie2,serie3]
        
    }
}







