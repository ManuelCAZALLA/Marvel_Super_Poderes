//
//  RootView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        
        switch rootViewModel.status {
        case .none:
            withAnimation {
                initialSplash()
            }
        case .loading:
            withAnimation {
                HeroesView(ViewModel: HeroesViewModel())
                
            }
        case .loaded:
            withAnimation {
                Text("Second Splash")
            }
        case .loadingSeries:
            withAnimation{
               Text("Series")            }
        case .error(error: let errorString):
            withAnimation {
                ErrorView(error: errorString)
            
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
