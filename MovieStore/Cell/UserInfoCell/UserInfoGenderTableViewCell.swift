//
//  UserInfoGenderTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/21/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserInfoGenderTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgIcon: UIImageView!
    @IBOutlet weak var radioMale: UIButton!
    @IBOutlet weak var radioFemale: UIButton!
    var gender:Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func selectRadioMale(_ sender: Any) {
        gender = true
        radioMale.setImage(UIImage.init(named: "selectRadioButton"), for: .normal)
        radioFemale.setImage(UIImage.init(named: "radioButton"), for: .normal)
    }
    
    @IBAction func selectRadioFemale(_ sender: Any) {
        gender = false
        radioFemale.setImage(UIImage.init(named: "selectRadioButton"), for: .normal)
        radioMale.setImage(UIImage.init(named: "radioButton"), for: .normal)
    }
    
    
}
