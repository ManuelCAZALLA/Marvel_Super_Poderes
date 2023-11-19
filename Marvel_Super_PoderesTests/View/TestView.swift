//
//  TestView.swift
//  Marvel_Super_PoderesTests
//
//  Created by Manuel Cazalla Colmenero on 19/11/23.
//

import XCTest
import SwiftUI
import ViewInspector
@testable import Marvel_Super_Poderes

final class TestView: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
            .environmentObject(RootViewModel())
        
        XCTAssertNotNil(view)
        
        let image =  try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(image)
        
        let serieTitle = try view.inspect().find(viewWithId: 1)
        XCTAssertNotNil(serieTitle)
        
        }
    func testErrorView() throws {
        let view = ErrorView(error: "Pantalla de error")
            .environmentObject(RootViewModel())
        
        XCTAssertNotNil(view)
        
        let image =  try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        let contentText = try text.text().string()
        XCTAssertEqual(contentText, "Volver a cargar")
        }
    
    func testSecondSplashView() throws {
        let view = SecondSplashView()
            .environmentObject(RootViewModel())
        
        XCTAssertNotNil(view)
        
        let text = try view.inspect().find(viewWithId: 2)
        XCTAssertNotNil(text)
        
        let contentText = try text.text().string()
        XCTAssertEqual(contentText, "Cargando Series...")
        
        let image =  try view.inspect().find(viewWithId: 0)
        XCTAssertNotNil(image)
        
        let image2 =  try view.inspect().find(viewWithId: 3)
        XCTAssertNotNil(image2)
       
    }
    

}
