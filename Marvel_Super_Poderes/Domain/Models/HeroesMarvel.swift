//
//  HeroesMarvel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 11/11/23.
//


import Foundation

// MARK: - DataClass
struct DataClass: Codable {
    let results: [HeroesMarvel]
}

// MARK: - Result
struct HeroesMarvel: Codable, Identifiable {
    let id: Int?
    let name, description: String?
    let thumbnail: Thumbnail?
    var UrlImage: String {
        "\(thumbnail?.path ?? "").\(thumbnail?.thumbnailExtension ?? "")".replacingOccurrences(of: "http", with: "https")
          
       }
      
   }
   
    
// MARK: - Thumbnail
struct Thumbnail: Codable {
        let path: String
        let thumbnailExtension: String?
        
        enum CodingKeys: String, CodingKey {
            case path
            case thumbnailExtension = "extension"
        }
    }
    
enum Extension: String, Codable {
        case gif = "gif"
        case jpg = "jpg"
    }
    

