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
        NavigationView{
            switch rootViewModel.status {
            case .none:
                withAnimation {
                    InitialSplash()
                }
            case .loaded:
                withAnimation {
                    HeroesView(viewModel: HeroesViewModel())
                    
                }
                
                case .loading:
                withAnimation {
                    SecondSplashView()
                }
                
                case .error(error: let errorString):
                withAnimation {
                    ErrorView(error: errorString)
                    
                }
            }
        }
    }
}

#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
