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
        ZStack {
                    AsyncImage(url: URL(string: heroes.urlImage)) { image in
                        image
                            .resizable()
                            .frame(width: 300, height: 200)
                            .aspectRatio(contentMode: .fill)
                            .cornerRadius(20)
                    } placeholder: {
                        Image(systemName: "person")
                    }

                    Text(heroes.name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                }
                
            }
        }

/*#Preview {
    HeroesRowView(
        heroes: HeroesMarvel(
            id: 1011334,
            name: "3-D Man",
            description: "",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784",
                thumbnailExtension: "jpg"
            )
        )
        )
    }*/

