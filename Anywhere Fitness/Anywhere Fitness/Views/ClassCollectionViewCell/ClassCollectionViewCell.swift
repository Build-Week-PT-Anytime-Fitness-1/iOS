//
//  ClassCollectionViewCell.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 27/02/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class ClassCollectionViewCell: UICollectionViewCell {

    //MARK: - IBOutlets
    @IBOutlet weak var classImageView: UIImageView!
    @IBOutlet weak var classTypeLabel: UILabel!
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var classCityLabel: UILabel!
    @IBOutlet weak var classRatingLabel: UILabel!
    
    //MARK: - Properties
    var exerciseClass: ExerciseClass? {
        didSet {
            updateCellData()
        }
    }
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
        updateCellData()
    }

    //MARK: - Private Functions
    private func setupViews() {
        //Configure classImageView rounded corners
        classImageView.clipsToBounds = true
        classImageView.layer.cornerRadius = 10
        classImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
    private func updateCellData() {
        guard let exerciseClass = exerciseClass else { return }
        
        classNameLabel.text = exerciseClass.name
        classTypeLabel.text = exerciseClass.type?.rawValue ?? "Other"
        classCityLabel.text = exerciseClass.location
        //classRatingLabel.text = MUST ADD RATING ON API
        //classImageView.image = MUST ADD IMAGE ON API
    }
    
}
