//
//  FirebaseController.swift
//  Anywhere Fitness
//
//  Created by Alex Shillingford on 2/27/20.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import Foundation
import Firebase

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
}
