//
//  HeroesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var viewModel: HeroesViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                List {
                    if let heroes = viewModel.heroes {
                        ForEach(heroes) { heroe in
                            NavigationLink(
                                destination: SeriesView(viewModelSerie: SeriesViewModel(heroe: heroe), heroe: heroe)
                            ) {
                                HeroesRowView(heroes: heroe)
                                    .frame(height: 200)
                            }
                        }
                    }
                }
                .navigationTitle("Heroes")
            }
            .tabItem {
                Label("Heroes", systemImage: "star") //
            }
            
            Text("Series")
                .tabItem {
                    Label("Series", systemImage: "circle")
                }
        }
    }
}


#Preview {
    HeroesView(viewModel: HeroesViewModel(testing: true))
    
}



