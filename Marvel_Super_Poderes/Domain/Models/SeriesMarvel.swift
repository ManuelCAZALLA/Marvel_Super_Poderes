//
//  Series.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 16/11/23.
//



// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct WelcomeSeries: Codable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: SeriesDataClass
}

// MARK: - DataClass
struct SeriesDataClass: Codable {
    let offset, limit, total, count: Int
    let results: [SeriesMarvel]
}

// MARK: - Result
struct SeriesMarvel: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let modified: String
    let thumbnail: Thumbnail
    var urlSeries: String {
        "\(thumbnail.path).\(thumbnail.thumbnailExtension)".replacingOccurrences(of: "http", with: "https")
    }
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



