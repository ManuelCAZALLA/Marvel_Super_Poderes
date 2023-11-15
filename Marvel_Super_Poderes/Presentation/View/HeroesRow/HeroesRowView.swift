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
            AsyncImage(url: URL(string: heroes.UrlImage)) { image in
                image
                    .resizable()
                    .cornerRadius(20)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
            }
            
            VStack{
                HStack{
                    if heroes.name != nil {
                        Text(heroes.name ?? "")
                            .font(.title)
                            .foregroundStyle(.black)
                            .bold()
                            .padding([.top, .leading], 20)
                        Spacer()
                    }
                    
                }
                Spacer()
            }
        }
    }
}
#Preview {
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
    }

