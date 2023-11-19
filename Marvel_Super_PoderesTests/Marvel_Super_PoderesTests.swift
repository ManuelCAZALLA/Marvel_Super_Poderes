//
//  Marvel_Super_PoderesTests.swift
//  Marvel_Super_PoderesTests
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import XCTest
import SwiftUI
import ViewInspector
import Combine

@testable import Marvel_Super_Poderes

final class Marvel_Super_PoderesTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
   
    }
    
    func testHeroDecoding() throws {
        let jsonData = """
            {
                "id": 1011334,
                "name": "Spider-Man",
                "description": "A radioactive spider gave Peter Parker superhuman abilities.",
                "modified": "2022-03-31T18:29:04-0400",
                "thumbnail": {
                    "path": "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                    "extension": "jpg"
                },
                "resourceURI": "http://gateway.marvel.com/v1/public/characters/1011334",
                "comics": {
                    "available": 364,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/comics",
                    "items": []
                },
                "series": {
                    "available": 173,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/series",
                    "items": []
                },
                "stories": {
                    "available": 1710,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/stories",
                    "items": []
                },
                "events": {
                    "available": 29,
                    "collectionURI": "http://gateway.marvel.com/v1/public/characters/1011334/events",
                    "items": []
                },
                "urls": []
            }
            """.data(using: .utf8)!
        
        let decoder = JSONDecoder()
        let hero = try decoder.decode(HeroesMarvel.self, from: jsonData)
        
        XCTAssertEqual(hero.id, 1011334)
        XCTAssertEqual(hero.name, "Spider-Man")
        XCTAssertEqual(hero.description, "A radioactive spider gave Peter Parker superhuman abilities.")
        XCTAssertNotNil(hero.modified)
        
    }
    
  
    func testInitialSplashView() throws {
        let view = InitialSplash()
            .environmentObject(RootViewModel())
        
        XCTAssertNotNil(view)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(text)
        
        let contentText = try text.text().string()
        XCTAssertEqual(contentText, "Cargando...")
    }
    
    func testHeroesRowView() throws {
        let view = HeroesRowView(heroes: HeroesMarvel(id: 1, name: "MarvelMan", description: "Soy MarvelMan", modified: "", thumbnail: HeroesMarvel.Thumbnail(path: "", thumbnailExtension: "")))
        
        XCTAssertNotNil(view)
        
        let image = try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let nameHero = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(nameHero)
        
    }
    
    func testSeriesRowView() throws {
        let view = SeriesRowView(serie: SeriesMarvel(id: 1, title: "Serie de Marvel", description: "Soy una serie", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: "")))
        
        XCTAssertNotNil(view)
        
        let image =  try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        let serieTitle = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(serieTitle)
}
    
    
    
    

