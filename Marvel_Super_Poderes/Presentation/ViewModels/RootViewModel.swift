//
//  RootViewModel.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 10/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject {
    private var suscriptor: Set<AnyCancellable> = []
    
    @Published var status = Status.initialSplash
    
    
}

