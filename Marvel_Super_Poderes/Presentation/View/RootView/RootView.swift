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
        case .initialSplash:
            withAnimation {
                initialSplash()
            }
        case .heroes:
            withAnimation {
                HeroesView()
            }
        case .secondSplash:
            withAnimation {
                Text("Second Splash")
            }
        case .series:
            withAnimation{
                Text("Series")
            }
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
