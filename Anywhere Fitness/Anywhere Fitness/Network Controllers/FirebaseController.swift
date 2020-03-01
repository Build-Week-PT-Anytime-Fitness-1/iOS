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
    
    func firebaseRegisterNewUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
            if let error = error {
                print("\(error)")
                return
            } else {
                print("Auth Result: \(String(describing: authResult))")
            }
        }
    }
    
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
                     capacity: Int) -> ExerciseClass {
        
        let newClass = ExerciseClass(name: name,
                                     location: location,
                                     type: type,
                                     startTime: startTime,
                                     duration: duration,
                                     intensityLevel: intensity,
                                     attendees: 1,
                                     maxClassSize: capacity,
                                     id: nil)
        
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
}
