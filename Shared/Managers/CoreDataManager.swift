//
//  CoreDataManager.swift
//  Fluidic
//
//  Created by user217900 on 5/28/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistantContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        persistantContainer = NSPersistentContainer(name: "FluidicModel")
        persistantContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
            
        }
    }
    
}
