//
//  initialSplash.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import SwiftUI

struct InitialSplash: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var rotation: Double = 0.0
    
    var body: some View {
        ZStack {
            Image(.fondoApp)
                .resizable()
                .opacity(1)
                .id(0)
            
            Image(decorative: "")
                .resizable()
                .background(Color.black)
                .opacity(0.2)
            
            VStack {
                Image(.marvel)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .padding(.top, 20)
                    .padding([.leading, .trailing], 50)
                    .id(1)
                
                Spacer()
                
                Image(systemName: "circle.dashed")
                    .resizable()
                    .foregroundColor(.blue)
                    .frame(width: 100, height: 100)
                    .rotationEffect(.degrees(rotation))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                            self.rotation = 360.0
                        }
                    }
                    .id(2)
                
                Spacer()
                
                Text("Cargando...")
                    .foregroundColor(.white)
                    .font(.title)
                    .id(3)
                
                Spacer()
                
                Image(.keepcoding1)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                    .padding(.bottom, 20)
                    .padding([.leading, .trailing], 70)
                    .id(4)
            }
        }
        .ignoresSafeArea()
        
        
    }
}




#Preview {
    InitialSplash()
}
