//
//  DetailView.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 15/11/23.
//

import SwiftUI

struct SeriesView: View {
    @StateObject var viewModelSerie: SeriesViewModel
    
    var heroe: HeroesMarvel?
    
    var body: some View {
            NavigationStack{
                List{
                    ForEach(viewModelSerie.series) { serie in
                        SeriesRowView(serie: serie)

                    }
                }
                
            }
        }
    }

#Preview {
    SeriesView(viewModelSerie: SeriesViewModel(heroe: HeroesMarvel(id: 1011442, name: "Hit-Monkey", description: "El mono saltarín", modified: "2022-04-14T19:56:30-0400", thumbnail: HeroesMarvel.Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/6/30/4ce69c2246c21", thumbnailExtension: "jpg")), testing: true))
}
     

