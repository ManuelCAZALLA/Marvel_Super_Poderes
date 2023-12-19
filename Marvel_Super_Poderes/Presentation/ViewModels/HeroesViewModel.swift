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
    
    var suscriptor = Set<AnyCancellable>()
    
    init(testing: Bool = false){
       
        if (testing){
            getHeroesTesting()
        }else {
            getHeroes()
        }
    }
    
    func getHeroes() {
        self.status = .loading
        
        URLSession.shared.dataTaskPublisher(for: BaseNetwork().getHeroes(sortBy: .recentModified))
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
    
    func getHeroesTesting() {
        self.status = .none
        self.heroes = getHeroesFake()
        self.status = .loaded
    }
    
    func getHeroesFake() -> [HeroesMarvel] {
        
        let hero1 = HeroesMarvel(id: 1011334, name: "3-D Man", description: "No me conocen ni en mi casa", modified: "2022-05-03T11:41:04-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784", thumbnailExtension: "jpg"))
        
        let hero2 = HeroesMarvel(id: 1017857, name: "A-Bomb (HAS)", description: "Soy man, MarvelMan", modified: "2023-09-14T12:40:07-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/3/20/5232158de5b16", thumbnailExtension: "jpg"))
        
        let hero3 = HeroesMarvel(id: 1011442, name: "Hit-Monkey", description: "El mono saltarín", modified: "2022-04-14T19:56:30-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg"))
        
        
        return [hero1, hero2, hero3]
        
        
    }
   
    
   
}
