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
    
    //MARK: - Properties
    var showPassword: Bool = false
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
    
}
