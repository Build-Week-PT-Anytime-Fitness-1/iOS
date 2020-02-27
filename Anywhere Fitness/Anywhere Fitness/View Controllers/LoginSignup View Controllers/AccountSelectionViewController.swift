//
//  AccountSelectionViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 26/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class AccountSelectionViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var clientStackView: UIStackView!
    @IBOutlet weak var clientButton: UIButton!
    @IBOutlet weak var instructorStackView: UIStackView!
    @IBOutlet weak var instructorButton: UIButton!
    
    //MARK: - Properties
    
    //MARK: -  View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        
        //Add corner radius to button images
        clientButton.layer.cornerRadius = 10
        clientButton.imageView?.contentMode = .scaleAspectFill
        clientButton.clipsToBounds = true
        instructorButton.layer.cornerRadius = 10
        instructorButton.imageView?.contentMode = .scaleAspectFill
        instructorButton.clipsToBounds = true

    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "clientSelectedShowSegue" {
            guard let confirmationVC = segue.destination as? AccountConfirmationViewController else { return }
            confirmationVC.selectedAccountType = .client
        } else if segue.identifier == "instructorSelectedShowSegue" {
            guard let confirmationVC = segue.destination as? AccountConfirmationViewController else { return }
            confirmationVC.selectedAccountType = .instructor
        }
    }

}
