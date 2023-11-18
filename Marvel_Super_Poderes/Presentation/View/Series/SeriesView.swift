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

    
     
     /*#Preview {
      DetailView(series: SeriesMarvel(
      id: 1945,
      title: "Avengers: The Initiative (2007 - 2010)",
      description: "",
      thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5", thumbnailExtension: "jpg")))
      }
      }
      */
     

