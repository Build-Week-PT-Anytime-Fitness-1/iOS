//
//  DataModel+Convenience.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 3/8/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import CoreData


    // MARK: - Exercise Class Represenation
extension LSIExerciseClass {

    
    var exerciseClass: ExerciseClass? {
        guard let name: String = name,
            let location: String = location,
            let type: ExerciseType = ExerciseType(rawValue: type ?? "other"),
            let startTime: Date = startTime,
            let duration: String = duration,
            let intensityLevel: IntensityLevel = IntensityLevel(rawValue: intensityLevel ?? "medium"),
            let id = id else { return nil }
        
        return ExerciseClass(name: name,
                             location: location,
                             type: type,
                             startTime: startTime,
                             duration: duration,
                             intensityLevel: intensityLevel,
                             attendees: attendees,
                             maxClassSize: maxClassSize,
                             id: id)
    }
    
    @discardableResult
    convenience init(name: String, type: String, startTime: Date, intensityLevel: String, attendees: Double, maxClassSize: Double, id: UUID? = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.name = name
        self.type = type
        self.startTime = startTime
        self.intensityLevel = intensityLevel
        self.attendees = attendees
        self.maxClassSize = maxClassSize
        self.id = id
    }
    
}


    // MARK: - User Representation
extension LSIUser {
    
    var user: User? {
        guard let email = email,
            let password = password,
            let name = name,
            let id = id else { return nil }
        
        return User(email: email,
                    password: password,
                    name: name,
                    id: id)
    }
    
    @discardableResult
    convenience init(name: String, email: String, password: String, id: UUID = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.name = name
        self.email = email
        self.password = password
        self.id = id
    }
}

