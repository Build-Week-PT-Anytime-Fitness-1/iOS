//
//  ExerciseClass.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

struct ExerciseClass {
    var name, location: String?
    var type: ExerciseType?
    var startTime: Date?
    var duration: String?
    var intensityLevel: IntensityLevel?
    var attendees, maxClassSize: Double? // Maybe consider changing to a double since cloud Firestore puts all numbers as doubles
    var id: UUID?
    
    var dictionary : [String:Any] {
         return [
                 "name": name  ?? "",
                 "location": location  ?? "",
                 "type": type  ?? "",
                 "startTime": startTime  ?? "",
                 "duration": duration  ?? "",
                 "intensityLevel": intensityLevel  ?? "",
                 "attendees": attendees  ?? "",
                 "maxClassSize": maxClassSize  ?? "",
                 "id": id  ?? "",
         ]
     }

    init(snapshot: QueryDocumentSnapshot) {
        id = UUID(uuidString: snapshot.documentID)
        let snapshotValue = snapshot.data()
         name = snapshotValue["name"] as? String
         location = snapshotValue["location"] as? String
        type = snapshotValue["type"] as? ExerciseType
        startTime = snapshotValue["startTime"] as? Date
        duration = snapshotValue["duration"] as? String
        intensityLevel = snapshotValue["intensityLevel"] as? IntensityLevel
        attendees = snapshotValue["attendees"] as? Double
        maxClassSize = snapshotValue["maxClassSize"] as? Double
     }
    
    init(name: String,
         location: String,
         type: ExerciseType,
         startTime: Date,
         duration: String,
         intensityLevel: IntensityLevel,
         attendees: Double,
         maxClassSize: Double,
         id: UUID = UUID()) {
        
        self.name = name
        self.location = location
        self.type = type
        self.startTime = startTime
        self.duration = duration
        self.intensityLevel = intensityLevel
        self.attendees = attendees
        self.maxClassSize = maxClassSize
        self.id = id
    }
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
