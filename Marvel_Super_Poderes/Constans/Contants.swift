//
//  Contants.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 11/11/23.
//

import Foundation
let apiKey = "182f1965b7b85d44b12945225e855bee"
let privateKey = "feef4e98e55e653555f9254f889a7311e7179a9b"
let baseURL1 = "https://gateway.marvel.com:443"
let ts = String(Date().timeIntervalSince1970)
let hash1 = "30465a13526b5a1e20215eafecaead1e"

struct HTTPMethods {
    static let get = "GET"
    static let post = "POST"
    static let content = "application/json"
}

enum Endpoints: String {
    case heroes = "/v1/public/characters"
    case series = "/v1/public/characters/{characterId}/series"
}
