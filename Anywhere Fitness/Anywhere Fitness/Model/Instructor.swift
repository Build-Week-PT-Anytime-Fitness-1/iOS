//
//  Instructor.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation

struct Instructor {
    var username, email, password: String
    var id: Int?
    var classes: [ExerciseClass]
}
