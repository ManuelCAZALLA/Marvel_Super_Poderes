//
//  HeroesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI

struct HeroesView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
   
    
    var body: some View {
        TabView {
            /*Button(action: {
                rootViewModel.fetchHeroes()
            }, label: {
                Text("Obtener Heroes")
         })   */
            Text("Heroes")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Heroes")
                }
                .environmentObject(rootViewModel)

            // Contenido de la segunda pestaña (Series)
            Text("Series")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Series")
                }
           
        }
        
    }
}

#Preview {
    HeroesView()
        .environmentObject(RootViewModel())
}

