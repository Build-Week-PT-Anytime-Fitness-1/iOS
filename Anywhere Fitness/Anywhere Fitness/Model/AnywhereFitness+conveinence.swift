//
//  AnywhereFitness+conveinence.swift
//  Anywhere Fitness
//
//  Created by Kevin Stewart on 2/28/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import CoreData


    // MARK: - Exercise Class Represenation
extension ExerciseClass {

    
    var exerciseClassRepresentation: ExerciseClassRepresentation? {
        guard let name: String = name,
            let type: ExerciseType = type,
            let startTime: Date = startTime,
            let intensityLevel: IntensityLevel = intensityLevel,
            let attendees: Int = Int(attendees),
            let maxClassSize: Int = Int(maxClassSize),
            let id = id else { return nil }
        
        return ExerciseClassRepresentation(name: name,
                                           type: type,
                                           intensityLevel: intensityLevel,
                                           id: id.uuidString,
                                           startTime: startTime,
                                           attendees: attendees,
                                           maxClassSize: maxClassSize)
    }
    
    @discardableResult
    convenience init(name: String, type: String, startTime: Date, intensityLevel: String, attendees: Int, maxClassSize: Int, id: UUID? = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.name = name
        self.type = type
        self.startTime = startTime
        self.intensityLevel = intensityLevel
        self.attendees = Int16(attendees)
        self.maxClassSize = Int16(maxClassSize)
        self.id = id
    }
    
}


    // MARK: - Client Representation
extension Client {

    
    var clientRepresentation: ClientRepresentation? {
        guard let email = email,
            let password = password,
            let username = username,
            let id = id else { return nil }
        
        return ClientRepresentation(username: username,
                                    email: email,
                                    password: password,
                                    id: id.uuidString)
    }
    
    @discardableResult
    convenience init(username: String, email: String, password: String, id: UUID = UUID(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.username = username
        self.email = email
        self.password = password
        self.id = id
    }
    
    
    
    
    // MARK: - Instructor Representation
}

extension Instructor {

    
    var instructorRepresentation: InstructorRepresentation? {
        guard let email = email,
            let password = password,
            let username = username,
            let classes = classes,
            let id = id else { return nil }
        
        return InstructorRepresentation(username: username,
                                        email: email,
                                        password: password,
                                        classes: classes,
                                        id: id.uuidString)
    }
    
    @discardableResult
    convenience init(username: String, email: String, password: String, id: UUID = UUID(), classes: String?, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.username = username
        self.email = email
        self.password = password
        self.classes = classes
        self.id = id
    }
    
    
    
    
    
}
