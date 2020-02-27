//
//  AccountConfirmationViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 26/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

enum SignupAccountType {
    case client
    case instructor
}

class AccountConfirmationViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var accountDescriptionLabel: UILabel!
    @IBOutlet weak var continueButton: UIButton!
    
    //MARK: - Properties
    var selectedAccountType: SignupAccountType? {
        didSet {
            guard isViewLoaded else { return }
            setupViews()
        }
    }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        //Configure Account Type StackView Elements
        accountImageView.layer.cornerRadius = 10
        accountImageView.clipsToBounds = true
        
        continueButton.layer.cornerRadius = continueButton.frame.height / 2
        
        if let accountType = selectedAccountType {
            switch accountType {
            case .client:
                accountTypeLabel.text = "Client"
                accountImageView.image = UIImage(named: "ClientIconImage")
                accountImageView.contentMode = .scaleAspectFill
                accountDescriptionLabel.text = "As a client, you will be able to search and  sign up for fitness classes based on location, skill level, and preferred workout type."
            case .instructor:
                accountTypeLabel.text = "Instructor"
                accountTypeLabel.textColor = ThemeController.shared.redButtonColor
                accountImageView.contentMode = .scaleAspectFill
                accountImageView.image = UIImage(named: "InstructorIconImage")
                accountDescriptionLabel.text = "As an instructor, you will be able to host and list sessions, manage attendees, and choose custom exercises based on location, skill, level and preferred workout type."
            }
        }
        
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "signUpShowSegue" {
            guard let signupVC = segue.destination as? SignUpViewController else { return }
            signupVC.selectedAccountType = selectedAccountType
        }
    }

}
