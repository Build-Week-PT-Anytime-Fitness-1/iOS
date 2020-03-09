//
//  AnywhereFitnessRepresentation.swift
//  Anywhere Fitness
//
//  Created by Kevin Stewart on 2/28/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation

struct InstructorRepresentation: Codable {
    var username, email, password, classes, id: String
}

struct ClientRepresentation: Codable {
    var username, email, password, id: String
}

struct ExerciseClassRepresentation: Codable {
    var name, type, intensityLevel, id: String
    var startTime: Date
    var attendees, maxClassSize: Int
}
