//
//  HeroesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI

struct HeroesView: View {
    @StateObject var ViewModel: ViewModelHeroes
    
    var body: some View {
        NavigationStack {
            List{
                if let heroes = ViewModel.heroes{
                    ForEach(heroes){ hero in
                        NavigationLink {
                            // TODO: DETAIL
                        } label: {
                           HeroesRowView(heroes: hero)
                                .frame(height: 200)
                        }

                    }
                }
            }
            .navigationTitle("Heroes")
        }
        
    }
}
#Preview {
    HeroesView(ViewModel: ViewModelHeroes(testing: true))
        
    }
    

