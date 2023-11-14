//
//  Marvel_Super_PoderesApp.swift
//  Marvel_Super_Poderes
//
//  Created by Manuel Cazalla Colmenero on 9/11/23.
//

import SwiftUI

@main
struct Marvel_Super_PoderesApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
           initialSplash()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
        }
    }
}
