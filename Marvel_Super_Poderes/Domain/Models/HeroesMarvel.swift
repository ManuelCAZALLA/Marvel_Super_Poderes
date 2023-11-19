//
//  HeroesMarvel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 11/11/23.
//


import Foundation

// MARK: - Instruction
struct Welcome: Codable {
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let offset: Int
    let limit: Int 
    let total: Int
    let count: Int
    let results: [HeroesMarvel]
}

// MARK: - Hero
struct HeroesMarvel: Codable, Identifiable{
    let id: Int
    let name: String
    let description: String
    let modified: String
    let thumbnail: Thumbnail
    var urlImage: String {
        "\(thumbnail.path).\(thumbnail.thumbnailExtension)".replacingOccurrences(of: "http", with: "https")
    }
    
  
    // MARK: - Thumbnail
    struct Thumbnail: Codable {
        let path: String
        let thumbnailExtension: String     
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }
    
    enum Extension: String, Codable {
        case gif = "gif"
        case jpg = "jpg"
    }
    
  
}
