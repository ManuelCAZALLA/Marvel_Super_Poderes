//
//  ErrorView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 14/11/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    private var textError: String
    
    init(error: String) {
        self.textError = error
    }
    
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundStyle(.red)
                .frame(width: 200, height: 200)
                .padding()
                .id(0)
            
            Text("\(textError)")
                .foregroundStyle(.red)
                .bold()
                .padding()
                .id(1)
            Spacer()
            
            Button {
                rootViewModel.status = .none
            } label: {
                Text("Volver a cargar")
                    .font(.title)
                    .foregroundStyle(.white)
                    .frame(width: 300, height: 50)
                    .background(.blue)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 20)
                    .id(2)
            }
            
        }
    }
}

#Preview {
    ErrorView(error: "Probando error")
        .environmentObject(RootViewModel())
}
