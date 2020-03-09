//
//  InstructorClassesViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 09/03/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit
import FirebaseAuth

protocol NewClassCreated {
    func updateClassTableView()
}

class InstructorClassesViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var searchBarTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let firebaseController = FirebaseController()
    var instructorClasses: [ExerciseClass]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureDelegates()
        firebaseController.delegate = self
        firebaseController.fetchAllClasses()
        filterByInstructorEmail()
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
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
        
        //Configure UINavigationBar
        ThemeController.shared.adjustNavigationBar(for: navigationController!.navigationBar)
        
        //Configure Title
        title = "My Classes"
        
        //Register cells for tableView
        let classCell = UINib(nibName: "ClassTableViewCell", bundle: nil)
        tableView.register(classCell, forCellReuseIdentifier: "ClassCell")
        tableView.backgroundColor = ThemeController.shared.darkGrayBackground
        tableView.tintColor = .clear
        tableView.layer.borderWidth = 1
        tableView.layer.borderColor = ThemeController.shared.lightTextIconColor.cgColor
        
    }
    
    private func configureDelegates() {
        searchBarTextField.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func filterByInstructorEmail() {
        var array: [ExerciseClass] = []
        
        if let currentEmail = Auth.auth().currentUser?.email {
            for exerciseClass in firebaseController.classes {
                if exerciseClass.instructorEmail == currentEmail {
                    array.append(exerciseClass)
                }
            }
            
            instructorClasses = array
            tableView.reloadData()
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddClassShowSegue" {
            guard let addClassVC = segue.destination as? AddNewClassViewController else { return }
            addClassVC.classWasCreatedDelegate = self
        }
    }

}

extension InstructorClassesViewController: UITableViewDelegate {
}

extension InstructorClassesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return instructorClasses!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ClassCell") as? ClassTableViewCell else { return UITableViewCell() }
        
        let exerciseClass = instructorClasses![indexPath.row]
        cell.categoryLabel.text = exerciseClass.type!.rawValue
        cell.nameLabel.text = exerciseClass.name
        cell.locationLabel.text = exerciseClass.location
        
        return cell
    }
    
}

extension InstructorClassesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}

extension InstructorClassesViewController: NewClassCreated {
    
    func updateClassTableView() {
        firebaseController.fetchAllClasses()
        filterByInstructorEmail()
        tableView.reloadData()
    }
    
}

extension InstructorClassesViewController: ClassesFetched {
    
    func classesWereFetched() {
        tableView.reloadData()
    }
    
}
