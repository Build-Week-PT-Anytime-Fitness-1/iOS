//
//  ClassTableViewCell.swift
//  Anywhere Fitness
//
//  Created by Eoin Lavery on 05/03/2020.
//  Copyright © 2020 Eoin Lavery. All rights reserved.
//

import UIKit

class ClassTableViewCell: UITableViewCell {

    //MARK: - Properties
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var classImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
