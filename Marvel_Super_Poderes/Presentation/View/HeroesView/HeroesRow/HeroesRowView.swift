//
//  HeroesRowView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 15/11/23.
//

import SwiftUI

struct HeroesRowView: View {
    var heroes: HeroesMarvel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: heroes.urlImage)) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 200)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(20)
                    .id(0)
            } placeholder: {
                Image(systemName: "person")
            }
            .overlay(
                VStack {
                    Spacer()
                    Text(heroes.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                }
            )
        }
    }
}


#Preview {
    HeroesRowView(
        heroes: HeroesMarvel(id: 1011442, name: "Hit-Monkey", description: "El mono saltarín", modified: "2022-04-14T19:56:30-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg")))
    
}

