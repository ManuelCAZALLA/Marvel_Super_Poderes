//
//  HeroesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var rootViewMoel: RootViewModel
    var net: Networking // Pasar como dependencia
    
    init(networking: Networking) {
        self.net = networking
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Button("Obtener Héroes") {
                        rootViewMoel.fetchHeroes()
                        
                    }
                }
               
            }
        }
    }
}



