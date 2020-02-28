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
    
    //MARK: - View Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }

    //MARK: - Private Functions
    private func setupViews() {
        //Configure classImageView rounded corners
        classImageView.clipsToBounds = true
        classImageView.layer.cornerRadius = 10
        classImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
    }
    
}
