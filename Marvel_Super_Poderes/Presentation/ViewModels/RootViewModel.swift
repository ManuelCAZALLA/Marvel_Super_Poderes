//
//  RootViewModel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 10/11/23.
//

import Foundation


final class RootViewModel: ObservableObject {
    
    @Published var status = Status.none
    @Published var selectedHero: HeroesMarvel?
    
}

