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
    @Published var series: [SeriesMarvel] = []
    
    var suscriptor = Set<AnyCancellable>()
    
    init(heroe: HeroesMarvel, testing: Bool = false) {
        self.heroe = heroe
        if (testing) {
            Networking().getHeroesFake()
        }else {
            getSeries()
        }
    }
    
    func getSeries() {
        self.status = .none
        
        URLSession.shared.dataTaskPublisher(for: Networking().getMarvelSeries(with: heroe.id, sortBy: .startYear))
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
        
    
    
}
