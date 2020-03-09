//
//  CoreDataStack.swift
//  Anywhere Fitness
//
//  Created by Kevin Stewart on 2/28/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {

static let shared = CoreDataStack()
private init() {}

lazy var container: NSPersistentContainer = {
    let newContainer = NSPersistentContainer(name: "Anywhere Fitness")
    newContainer.loadPersistentStores { (_, error) in
        if let error = error {
            fatalError("Failed to load persistent stores: \(error)")
        }
    }
    newContainer.viewContext.automaticallyMergesChangesFromParent = true
    return newContainer
}()

var mainContext: NSManagedObjectContext {
    return container.viewContext
}

func save(context: NSManagedObjectContext) throws {
    var savedError: Error?
    
    context.performAndWait {
        do {
            try context.save()
        } catch {
            savedError = error
        }
    }
    
    if let savedError = savedError { throw savedError}
    }
}

