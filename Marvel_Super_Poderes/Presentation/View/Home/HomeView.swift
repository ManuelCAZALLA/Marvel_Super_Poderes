//
//  HomeView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 12/11/23.
//

import SwiftUI


struct HomeView: View {
    @State var rootViewModel = RootViewModel()
    var body: some View {
        TabView {
           
            HeroesView(networking: Networking())
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Heroes")
                }
                .environmentObject(rootViewModel)
            Text("Series")
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Series")
                }
            
        }
    }
}

#Preview {
    HomeView()
}
