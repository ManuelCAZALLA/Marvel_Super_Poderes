//
//  TestModels.swift
//  Marvel_Super_PoderesTests
//
//  Created by Manuel Cazalla Colmenero on 19/11/23.
//

import XCTest
@testable import Marvel_Super_Poderes

final class TestModels: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testHeroesModel() throws {
        let heroe = HeroesMarvel(id: 1, name: "SpiderMan", description: "Hombre araña", modified: "", thumbnail: HeroesMarvel.Thumbnail(path: "", thumbnailExtension: ""))
        
        XCTAssertNotNil(heroe)
        XCTAssertEqual(heroe.name, "SpiderMan")
        XCTAssertNotNil(heroe.id)
        XCTAssertEqual(heroe.description, "Hombre araña")
        
    }
    
    func testSeriesModels() throws{
        let serie = SeriesMarvel(id: 100, title: "Test De Serie", description: "Descripcion", modified: "", thumbnail: Thumbnail(path: "", thumbnailExtension: ""))
        
        XCTAssertNotNil(serie)
        XCTAssertEqual(serie.title, "Test De Serie")
        XCTAssertNotNil(serie.id)
        XCTAssertEqual(serie.description, "Descripcion")
        
        
    }
}
