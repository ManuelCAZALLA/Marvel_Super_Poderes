//
//  ViewModelHeroes.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import Foundation
import Combine

final class ViewModelHeroes: ObservableObject {
    @Published var heroes: [HeroesMarvel]?
    @Published var status = Status.initialSplash
    
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
        
        self.status = .initialSplash
        
        URLSession.shared.dataTaskPublisher(for: Networking().getHeroes())
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: [HeroesMarvel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure:
                    self.status = .error(error: "No se han encontrado heroes")
                    
                case .finished:
                    self.status = .heroes
                }
            } receiveValue: { data in
                self.heroes = data
            }
            .store(in: &suscriptor)
    }
    // Quitar de aqui
    func getHeroesTesting() {
        self.status = .initialSplash
        self.heroes = Networking().getHeroesFake()
        self.status = .heroes
    }
    // Domain - caso de uso: Real y testing REpository - Network: Real y testing y en NetWorkingTEst iria lo de abajo
    
   
}
