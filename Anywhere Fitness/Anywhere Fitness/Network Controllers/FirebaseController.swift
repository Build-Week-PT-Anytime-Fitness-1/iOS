//
//  FirebaseController.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import Firebase

enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
    case post = "POST"
    case delete = "DELETE"
}

class FirebaseController {
    let baseURL = URL(string: "https://anywhere-fitness-1.firebaseio.com/")!
    let db = Firestore.firestore()
    
    
    // In an attempt to accomodate Firebase' lack of ability to add multiple parameters for new user registration and auth, instead just creating instructors and users altogether and then sorting where the users' email and id is stored based on the signupAccountType.
    func firebaseRegisterNewUser(user: User, signupAccountType: SignupAccountType) {
        Auth.auth().createUser(withEmail: user.email, password: user.password) { (authResult, error) in
            if let error = error {
                print("\(error)")
                return
            } else {
                print("Auth Result: \(String(describing: authResult))")
            }
        }
        
        switch signupAccountType {
        case .client:
            db.collection("clients").addDocument(data: [
                "email" : "\(user.email)",
                "id" : "\(user.id.uuidString)",
                "instructor" : false,
            ])
        case .instructor:
            print("instructor")
        }
    }
    
    // Upon login, the firebaseLoginUser() method will need to find the users' id in the database to determine whether you are an instructor or a client, and then populate the appropriate environment inside the app.
    func firebaseLoginUser(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard self != nil else { return }
            if let error = error {
                print("\(error)")
            } else {
                print("Auth Result: \(String(describing: authResult))")
            }
        }
    }
    
    func createClass(name: String,
                     location: String,
                     type: ExerciseType,
                     startTime: Date,
                     duration: String,
                     intensity: IntensityLevel,
                     capacity: Int,
                     id: UUID = UUID()) -> ExerciseClass {
        
        let newClass = ExerciseClass(name: name,
                                     location: location,
                                     type: type,
                                     startTime: startTime,
                                     duration: duration,
                                     intensityLevel: intensity,
                                     attendees: 1,
                                     maxClassSize: capacity,
                                     id: id)
        
        let requestURL = baseURL.appendingPathExtension("json")
        var request = URLRequest(url: requestURL)
        request.httpMethod = HTTPMethod.post.rawValue
        
        URLSession.shared.dataTask(with: request) { (_, response, error) in
            if let error = error {
                NSLog("Error POSTing new class: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse,
                response.statusCode != 201 {
                NSLog("Response status code: \(response.statusCode)")
            }
        }.resume()
        
        return newClass
    }
    
    func fetchAllClasses() {
        db.collection("classes").getDocuments { (snapshot, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let documents = snapshot?.documents {
                for document in documents {
                    print("\(document)")
                }
            }
        }
    }
}
