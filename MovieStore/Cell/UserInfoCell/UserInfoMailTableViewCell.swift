//
//  UserInfoMailTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/22/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserInfoMailTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgIcon: UIImageView!
    @IBOutlet weak var nameMail: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
