//
//  HeroesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var ViewModel: HeroesViewModel
    
    var body: some View {
        NavigationStack {
            List{
                if let heroes = ViewModel.heroes {
                    ForEach(heroes){ heroe in
                            NavigationLink {
                                SeriesView(viewModelSerie: SeriesViewModel(heroe: heroe), heroe: heroe)
                            } label: {
                                HeroesRowView(heroes: heroe)
                                    .frame(height: 200)
                                
                            }
                        }
                    }
                }
            }
        }
    }

#Preview {
    HeroesView(ViewModel: HeroesViewModel(testing: true))
        
    }
    


