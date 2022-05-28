//
//  FluidicApp.swift
//  Shared
//
//  Created by user217900 on 5/28/22.
//

import SwiftUI

@main
struct FluidicApp: App {
    
    let persistentContainer = CoreDataManager.shared.persistantContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistentContainer.viewContext)
        }
    }
}
