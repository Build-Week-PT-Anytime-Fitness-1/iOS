//
//  InstructorClassesViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 09/03/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class InstructorClassesViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDelegates()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        
        //Configure UITextFields
        searchBarTextField.backgroundColor = .clear
        searchBarTextField.layer.borderWidth = 1
        searchBarTextField.layer.cornerRadius = 3
        searchBarTextField.layer.borderColor =
            ThemeController.shared.lightTextIconColor.cgColor
        searchBarTextField.textColor = ThemeController.shared.lightTextIconColor
        
    }
    
    private func configureDelegates() {
        searchBarTextField.delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InstructorClassesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}
