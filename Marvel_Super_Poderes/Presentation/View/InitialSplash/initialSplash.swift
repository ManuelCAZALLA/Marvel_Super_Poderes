//
//  initialSplash.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import SwiftUI
import Combine

struct initialSplash: View {
    @State private var isTimerActive = false
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        
        ZStack{
            Image(.fondoApp)
                .resizable()
                .opacity(1)
            
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.2)
            
            VStack{
                Image(.marvel)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .padding(.top, 20)
                    .padding([.leading, .trailing], 50)
                Spacer()
                
                Image(systemName: "circle.dashed")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                
                Text("Cargando...")
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()
                
                
                Image(.keepcoding1)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .padding(.bottom, 20)
                    .padding([.leading, .trailing], 70)
            }
            
        }
        .ignoresSafeArea()
        
    }
}


#Preview {
    initialSplash()
}
