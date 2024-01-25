//
//  Contants.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 11/11/23.
//

import Foundation

enum Server: String {
    case apiKey = "182f1965b7b85d44b12945225e855bee"
    case ts = "1"
    case hash1 = "30465a13526b5a1e20215eafecaead1e"
}

enum HTTPMethods: String{
   case get = "GET"
    case post = "POST"
    case content = "application/json"
}

enum Endpoints: String {
    case baseURL1 = "https://gateway.marvel.com:443"
    case heroes = "/v1/public/characters"
    case series = "/series"
}

enum OrderBy: String {
    case formerModified = "-modified"
    case recentModified = "modified"
    case startYear = "startYear"
}
