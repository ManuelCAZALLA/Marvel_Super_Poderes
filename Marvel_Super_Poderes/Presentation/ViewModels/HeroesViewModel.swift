//
//  ViewModelHeroes.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import Foundation
import Combine

final class HeroesViewModel: ObservableObject {
    @Published var heroes: [HeroesMarvel]?
    @Published var status = Status.none
    
    //TODO:  CASO DE USO
    
    var suscriptor = Set<AnyCancellable>()
    // Hacer con protocolo
    init(testing: Bool = false){
        if (testing){
            getHeroesTesting()
        }else {
            getHeroes()
        }
    }
    
    func getHeroes() {
        self.status = .loading
        
        URLSession.shared.dataTaskPublisher(for: Networking().getHeroes(sortBy: .formerModified))
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                
                return $0.data
            }
            .decode(type: Welcome.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error: \(error)")
                case .finished:
                    self.status = .loaded
                }
            } receiveValue: { data in
               
                self.heroes = data.data.results
            }
          

.store(in: &suscriptor)
    }
    // Quitar de aqui
    func getHeroesTesting() {
        self.status = .none
        self.heroes = Networking().getHeroesFake()
        self.status = .loading
    }
    // Domain - caso de uso: Real y testing REpository - Network: Real y testing y en NetWorkingTEst iria lo de abajo
    
   
}
