//
//  TestViewModels.swift
//  Marvel_Super_PoderesTests
//
//  Created by Manuel Cazalla Colmenero on 19/11/23.
//

import XCTest
import Combine
@testable import Marvel_Super_Poderes

final class TestViewModels: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewModelHero() throws {
        var suscriptor = Set<AnyCancellable>()
        let expectation = self.expectation(description: "Descarga de heroes")
        
        let viewModel = HeroesViewModel(testing: true)
        XCTAssertNotNil(viewModel)
        
        viewModel.$status
            .sink { status in
                switch status {
                case .error(let error):
                    XCTFail("Error: \(error)")
                    expectation.fulfill() // error
                case .loaded:
                    XCTAssert(true)
                    expectation.fulfill() // success
                default:
                    break
                }
            }
            .store(in: &suscriptor)
        
         _ = viewModel.getHeroesFake()
        
        self.waitForExpectations(timeout: 10)
    }
    
    func testViewModelSeries() throws {
            let expectation = XCTestExpectation(description: "Descarga de series")
            
        let viewModel = SeriesViewModel(heroe: HeroesMarvel(id: 2, name: "Hulk", description: "", modified: "", thumbnail: HeroesMarvel.Thumbnail(path: "", thumbnailExtension: "")))
            XCTAssertNotNil(viewModel)
            
            var suscriptor = Set<AnyCancellable>()
            
        viewModel.$status
                .sink { status in
                    switch status {
                    case .error(let error):
                        XCTFail("Error: \(error)")
                    case .loaded:
                        XCTAssert(true)
                    default:
                        break
                    }
                    expectation.fulfill()
                }
                .store(in: &suscriptor)
             _ = viewModel.getSeriesFake()
        
            wait(for: [expectation], timeout: 10)
        }
    
    }


