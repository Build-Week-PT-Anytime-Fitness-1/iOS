//
//  SignUpViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 26/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var authCodeTextField: UITextField!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var authCodeLabel: UILabel!
    
    //MARK: - Properties
    var showPassword: Bool = false
    var selectedAccountType: SignupAccountType?
    
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
        let textFields = [nameTextField, emailTextField, passwordTextField, authCodeTextField]
        
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
        
        //Configure signUpButton
        signUpButton.layer.cornerRadius = signUpButton.frame.height / 2
        
        //Configure authCodeTextField
        guard let selectedAccountType = selectedAccountType else { return }
        
        if selectedAccountType == .client {
            authCodeLabel.isHidden = true
            authCodeTextField.isHidden = true
        }
        
    }
    
    private func configureDelegates() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        authCodeTextField.delegate = self
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
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        if let email = emailTextField.text,
            !email.isEmpty,
            let password = passwordTextField.text,
            !password.isEmpty {
            //firebaseController.firebaseRegisterNewUser(user: email, signupAccountType: password)
        }
    }
    
}

extension SignUpViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
