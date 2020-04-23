//
//  UserInfoBirthdayTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/22/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserInfoBirthdayTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgIcon: UIImageView!
    @IBOutlet weak var dateYearBtn: UIButton!
    
    func selectDate(date:String) {
        dateYearBtn.setTitle(date, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
