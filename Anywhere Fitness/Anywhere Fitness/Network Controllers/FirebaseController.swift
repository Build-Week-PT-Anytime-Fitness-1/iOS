//
//  FirebaseController.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import FirebaseFirestore
import Firebase

protocol ClassesFetched {
    func classesWereFetched()
}

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class FirebaseController {
    let baseURL = URL(string: "https://anywhere-fitness-1.firebaseio.com/")!
    let db = Firestore.firestore()
    
    var classes: [ExerciseClass] = []
    var delegate: ClassesFetched?
    
    // In an attempt to accomodate Firebase' lack of ability to add multiple parameters for new user registration and auth, instead just creating instructors and users altogether and then sorting where the users' email and id is stored based on the signupAccountType.
    
    // TODO: Add ability to store users name that's input in the login/signup storyboards
    func firebaseRegisterNewUser(email: String, password: String, name: String, signupAccountType: SignupAccountType) {
        let user = User(email: email, password: password, name: name, id: UUID())
        
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("\(error)")
                return
            } else {
                print("Auth Result: \(String(describing: authResult))")
            }
        }
        
        switch signupAccountType {
        case .client:
            db.collection("clients").document("\(user.id.uuidString)").setData([
                "email" : "\(user.email)",
                "id" : "\(user.id.uuidString)",
                "instructor" : false,
            ])
        case .instructor:
            db.collection("clients").document("\(user.id.uuidString)").setData([
                "email" : "\(user.email)",
                "id" : "\(user.id.uuidString)",
                "instructor" : true,
            ])
        }
    }
    
    // Upon login, the firebaseLoginUser() method will need to find the users' id in the database to determine whether you are an instructor or a client, and then populate the appropriate environment inside the app.
    func firebaseLoginUser(email: String, password: String, signInAccountType: SignupAccountType) {
        switch signInAccountType {
        case .client:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard self != nil else { return }
                if let error = error {
                    print("\(error)")
                } else {
                    print("Auth Result: \(String(describing: authResult))")
                }
            }
        case .instructor:
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard self != nil else { return }
                if let error = error {
                    print("\(error)")
                } else {
                    print("Auth Result: \(String(describing: authResult))")
                }
            }
        }
    }
    
    func createClass(name: String,
                     location: String,
                     type: ExerciseType,
                     startTime: Date,
                     duration: String,
                     intensity: IntensityLevel,
                     capacity: Double,
                     id: UUID = UUID()) -> ExerciseClass {
        
        let newClass = ExerciseClass(name: name,
                                     location: location,
                                     type: type,
                                     startTime: startTime,
                                     duration: duration,
                                     intensityLevel: intensity,
                                     attendees: 0,
                                     maxClassSize: capacity,
                                     id: id)
        
        db.collection("classes").document("\(id.uuidString)").setData([
            "name" : "\(name)",
            "location" : "\(location)",
            "exerciseType" : "\(type.rawValue)",
            "startTime" : "\(startTime)",
            "duration" : "\(duration)",
            "intensityLevel" : "\(intensity.rawValue)",
            "attendees" : "\(capacity)",
            "id" : "\(id.uuidString)",
        ])
        
        return newClass
    }
    
    func fetchAllClasses() {
        db.collection("classes").getDocuments { (snapshot, error) in

            if let error = error {
                print("Error FETCHING CLASSES: \(error)")
                return
            }

            if let documents = snapshot?.documents {
                for document in documents {
                    let newClass = ExerciseClass(snapshot: document)
                    self.classes.append(newClass)
                }
                
                self.delegate?.classesWereFetched()
            }
        }
        
    }
}
