//
//  AddNewClassViewController.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 09/03/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit
import FirebaseAuth

class AddNewClassViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var classNameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var aboutClassTextView: UITextView!
    
    @IBOutlet weak var cardioTypeButton: UIButton!
    @IBOutlet weak var strengthTypeButton: UIButton!
    @IBOutlet weak var highIntensityButton: UIButton!
    @IBOutlet weak var otherTypeBytton: UIButton!
    
    @IBOutlet weak var easyIntensityButton: UIButton!
    @IBOutlet weak var mediumIntensityButton: UIButton!
    @IBOutlet weak var hardIntensityButton: UIButton!
    @IBOutlet weak var extremeIntensityButton: UIButton!
    
    @IBOutlet weak var startTimeDatePicker: UIDatePicker!
    
    @IBOutlet weak var classDurationTextField: UITextField!
    @IBOutlet weak var maximumAttendeesTextField: UITextField!
    
    @IBOutlet weak var addClassButton: UIButton!
    
    //MARK: - Properties
    let firebaseController = FirebaseController()
    var selectedClassType: ExerciseType?
    var intensityLevel: IntensityLevel?
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        configureDelegates()
    }
    
    private func setupViews() {
        
        //Configure UITextFields
        let textFields = [classNameTextField, locationTextField, classDurationTextField, maximumAttendeesTextField]
        
        for textField in textFields {
            textField?.backgroundColor = .clear
            textField?.layer.borderWidth = 1
            textField?.layer.cornerRadius = 3
            textField?.layer.borderColor =
                ThemeController.shared.lightTextIconColor.cgColor
            textField?.textColor = ThemeController.shared.lightTextIconColor
        }
        
        aboutClassTextView.backgroundColor = .clear
        aboutClassTextView.layer.borderWidth = 1
        aboutClassTextView.layer.cornerRadius = 3
        aboutClassTextView.layer.borderColor = ThemeController.shared.lightTextIconColor.cgColor
        aboutClassTextView.textColor = ThemeController.shared.lightTextIconColor
     
        //Configure ClassType and Intensity UIButtons
        let buttons = [cardioTypeButton, strengthTypeButton, highIntensityButton, otherTypeBytton, easyIntensityButton, mediumIntensityButton, hardIntensityButton, extremeIntensityButton]
        
        for button in buttons {
            button?.backgroundColor = .clear
            button?.layer.borderWidth = 1
            button?.layer.cornerRadius = 3
            button?.layer.borderColor = ThemeController.shared.lightTextIconColor.cgColor
            button?.tintColor = ThemeController.shared.lightTextIconColor
        }
        
        startTimeDatePicker.setValue(UIColor.white, forKey: "textColor")
        
        addClassButton.layer.cornerRadius = addClassButton.frame.height / 2
    }
    
    private func configureDelegates() {
        let textFields = [classNameTextField, locationTextField, classDurationTextField, maximumAttendeesTextField]
        
        for textField in textFields {
            textField?.delegate = self
        }
    }

    
    //MARK: - IBActions
    @IBAction func addClassPressed(_ sender: Any) {
        
        guard let classType = self.selectedClassType,
            let intensityLevel = self.intensityLevel,
            locationTextField != nil,
            classDurationTextField != nil,
            maximumAttendeesTextField != nil
        else { return }
        
        let startDate = startTimeDatePicker.date
        
        if let currentUser = Auth.auth().currentUser {
            
        }
        
        let _ = firebaseController.createClass(name: classNameTextField.text!, location: locationTextField.text!, type: classType, startTime: startDate, duration: classDurationTextField.text!, intensity: intensityLevel, capacity: 0.0, user: User())
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func classTypeSelected(_ sender: UIButton) {
        let buttons = [cardioTypeButton, strengthTypeButton, highIntensityButton, otherTypeBytton]
        
        switch sender {
        case cardioTypeButton:
            selectedClassType = .cardio
        case strengthTypeButton:
            selectedClassType = .strengthTraining
        case highIntensityButton:
            selectedClassType = .hiit
        case otherTypeBytton:
            selectedClassType = .other
        default:
            selectedClassType = .other
        }
        
        for button in buttons {
            if button != sender {
                button?.backgroundColor = .clear
                button?.tintColor = .white
            } else {
                button?.backgroundColor = ThemeController.shared.lightTextIconColor
                button?.tintColor = ThemeController.shared.darkGrayBackground
            }
        }
    }
    
    @IBAction func classIntensitySelected(_ sender: UIButton) {
        let buttons = [easyIntensityButton, mediumIntensityButton, hardIntensityButton, extremeIntensityButton]
        
        switch sender {
        case easyIntensityButton:
            intensityLevel = .easy
        case mediumIntensityButton:
            intensityLevel = .medium
        case hardIntensityButton:
            intensityLevel = .hard
        case extremeIntensityButton:
            intensityLevel = .extreme
        default:
            intensityLevel = .easy
        }
        
        for button in buttons {
            if button != sender {
                button?.backgroundColor = .clear
                button?.tintColor = .white
            } else {
                button?.backgroundColor = ThemeController.shared.lightTextIconColor
                button?.tintColor = ThemeController.shared.darkGrayBackground
            }
        }
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

extension AddNewClassViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
    }
}

extension AddNewClassViewController: UIPickerViewDelegate {
    
}
