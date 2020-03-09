//
//  LoginViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 27/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginTypeSegmentedControl: UISegmentedControl!
    
    //MARK: - Properties
    var showPassword: Bool = false
    var firebaseController = FirebaseController()
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDelegates()
    }

    //MARK: - Private Functions
    private func setupViews() {
        
        //Configure UITextFields
        let textFields = [emailTextField, passwordTextField]
        
        for textField in textFields {
            textField?.backgroundColor = .clear
            textField?.layer.borderWidth = 1
            textField?.layer.cornerRadius = 3
            textField?.layer.borderColor = ThemeController.shared.lightTextIconColor.cgColor
            textField?.textColor = ThemeController.shared.lightTextIconColor
        }
        
        //Configure showPasswordButton
        showPasswordButton.layer.cornerRadius = 1
        showPasswordButton.layer.borderWidth = 1
        showPasswordButton.layer.borderColor = ThemeController.shared.lightTextIconColor.cgColor
        showPasswordButton.layer.backgroundColor = UIColor.clear.cgColor
        
        //Configure loginButton
        loginButton.layer.cornerRadius = loginButton.frame.height / 2
    }
    
    private func configureDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    //MARK: - IBActions
    @IBAction func showPasswordPressed(_ sender: Any) {
        if showPassword == false {
            showPassword = true
            showPasswordButton.layer.backgroundColor = ThemeController.shared.lightTextIconColor.cgColor
        } else {
            showPassword = false
            showPasswordButton.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let email = emailTextField.text,
            let password = passwordTextField.text else { return }
        
        if !email.isEmpty && !password.isEmpty {
            switch loginTypeSegmentedControl.selectedSegmentIndex {
            case 0:
                firebaseController.firebaseLoginUser(email: email, password: password, signInAccountType: .client)
                performSegue(withIdentifier: "ClientHomeSegue", sender: sender)
            case 1:
                firebaseController.firebaseLoginUser(email: email, password: password, signInAccountType: .instructor)
                performSegue(withIdentifier: "InstructorHomeSegue", sender: sender)
            default:
                print("Somehow impossibly you've hit the unknown default. This feels unnecessary but it gets rid of the `Switch must be exhaustive` error")
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Please fill out all the required text fields before logging in.", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
        }
    }
    
    
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
