//
//  LandingPageViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 26/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class LandingPageViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var joinNowButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    //MARK: - Private Functions
    private func setupViews() {
        
        //Configure UINaviagtionBar theme
        if let navBar = self.navigationController?.navigationBar {
            ThemeController.shared.adjustNavigationBar(for: navBar)
        }
        
        //Configure Join Button
        joinNowButton.layer.cornerRadius = joinNowButton.frame.height / 2
        
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
