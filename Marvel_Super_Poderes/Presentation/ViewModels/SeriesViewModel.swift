//
//  SeriesViewModel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 17/11/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    @Published var status = Status.none
    @Published var heroe: HeroesMarvel
    @Published var series: [SeriesMarvel]?
    
    var suscriptor = Set<AnyCancellable>()
    
    init(heroe: HeroesMarvel, testing: Bool = false) {
        self.heroe = heroe
        if (testing) {
            getSeriesFake()
        }else {
            getSeries()
        }
    }
    
    func getSeries() {
        self.status = .none
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getMarvelSeries(with: heroe.id, sortBy: .startYear))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: WelcomeSeries.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    self.status = .loading
                }
            } receiveValue: { data in
               
                self.series = data.data.results
            }
            .store(in: &suscriptor)
          
            }
        
    func getSeriesFake() -> [SeriesMarvel] {
        
        let serie1 = SeriesMarvel(id: 17765, title: "FREE COMIC BOOK DAY 2013 1 (2013)", description: "FreeCommic", modified: "2019-09-23T20:59:37-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", thumbnailExtension: "jpg"))
        
        let serie2 = SeriesMarvel(id: 3374, title: "Hulk (2008 - 2012)", description: "General Thunderbolt Ross spent years hunting the Hulk, but now he's become one himself! As the rampaging Red Hulk, Ross strives to reconcile the man he used to be with the monster he's becomes, smashing anything that moves along the way!", modified:"2020-09-04T09:03:42-0400", thumbnail: Thumbnail(path:"http://gateway.marvel.com/v1/public/series/3374", thumbnailExtension: "jpg"))
        
        let serie3 = SeriesMarvel(id: 374, title: "Hulk ", description: "La Serie", modified:"2020-09-04T09:03:42-0400", thumbnail: Thumbnail(path:"", thumbnailExtension: "jpg"))
        
        
        return [serie1,serie2,serie3]
        
    }
    
}
