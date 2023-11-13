//
//  RootViewModel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 10/11/23.
//

import Foundation
import Combine

class RootViewModel: ObservableObject {
    private var suscriptor: Set<AnyCancellable> = []
    
    func fetchHeroes() {
        let request = Networking().getHeroes()
        
        URLSession.shared.dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error en la llamada:", error)
                }
            }, receiveValue: { data, response in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON recibido:", jsonString)
                }
                
                do {
                    
                    let heroes = try JSONDecoder().decode([HeroesMarvel].self, from: data)
                    
                    print("Héroes :", heroes)
                } catch {
                    print("Error al decodificar:", error)
                }
            })
            .store(in: &suscriptor)
    }
}
