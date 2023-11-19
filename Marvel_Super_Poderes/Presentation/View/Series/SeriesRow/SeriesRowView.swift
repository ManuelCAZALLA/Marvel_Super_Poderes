//
//  SeriesView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 18/11/23.
//

import SwiftUI

struct SeriesRowView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var serie: SeriesMarvel

    var body: some View {
        VStack {
            Text(serie.title)
                .font(.title)
                .padding()
                .bold()
                .opacity(0.7)
                .id(0)

            AsyncImage(url: URL(string: "\(serie.urlSeries)")) { Image in
                Image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .padding()
                    .id(1)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(20)
                    .opacity(0.7)
                    .padding()
            }

            if let description = serie.description {
                Text("\(description)")
                    .font(.callout)
                    .foregroundColor(.black)
                    .padding()
            } else {
                Text("No description")
                    .font(.title)
                    .foregroundColor(.black)
                    .padding()
            }
        }
        .navigationBarItems(leading: backButton)
    }

    var backButton: some View {
        Button {
            rootViewModel.status = .loaded
        } label: {
            Label("Back", systemImage: "chevron.left")
                .foregroundColor(Color.blue)
        }
        .padding([.leading, .top], 16)
    }
}


#Preview {
 SeriesRowView(serie: SeriesMarvel(id: 3374, title: "Hulk (2008 - 2012)", description: "General Thunderbolt Ross spent years hunting the Hulk, but now he's become one himself! As the rampaging Red Hulk, Ross strives to reconcile the man he used to be with the monster he's becomes, smashing anything that moves along the way!", modified:"2020-09-04T09:03:42-0400", thumbnail: Thumbnail(path:"http://gateway.marvel.com/v1/public/series/3374", thumbnailExtension: "jpg")))
 }
 
