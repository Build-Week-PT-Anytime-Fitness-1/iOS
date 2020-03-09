//
//  ExerciseClass.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation

struct ExerciseClass {
    var name, location: String
    var type: ExerciseType
    var startTime: Date
    var duration: String
    var intensityLevel: IntensityLevel
    var attendees, maxClassSize: Int // Maybe consider changing to a double since cloud Firestore puts all numbers as doubles
    var id: UUID
}

enum ExerciseType: String {
    case cardio = "cardio"
    case strengthTraining = "strengthTraining"
    case hiit = "hiit"
    case other = "other"
}

enum IntensityLevel: String {
    case easy = "easy"
    case medium = "medium"
    case hard = "hard"
    case extreme = "extreme"
}

struct PunchPass {
    var classID: Int
    var currentPunchCount: Int
    var maxPunchCount: Int
}
