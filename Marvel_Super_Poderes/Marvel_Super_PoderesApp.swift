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
            RootView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(rootViewModel)
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        rootViewModel.status = .loaded
                    }
                }
        }
    }
}
