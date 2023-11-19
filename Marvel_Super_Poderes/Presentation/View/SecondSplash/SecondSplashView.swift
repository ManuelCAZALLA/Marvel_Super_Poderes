//
//  SecondSplash.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 15/11/23.
//

import SwiftUI
import Combine

struct SecondSplashView: View {
    @State private var rotation = 0.0
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        
        ZStack{
            Image(.secondSplash1)
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
                    .rotationEffect(.degrees(rotation))
                    .onAppear {
                        withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                            self.rotation = 360.0
                        }
                    }
                Spacer()
                
                Text("Cargando Series...")
                    .foregroundColor(.white)
                    .font(.title)
                
                Spacer()
                
                
                Image(.keepcoding1)
                    .resizable()
                    .scaledToFit()
                    .padding(.bottom, 20)
                    .padding([.leading, .trailing], 70)
            }
            
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    SecondSplashView()
}
