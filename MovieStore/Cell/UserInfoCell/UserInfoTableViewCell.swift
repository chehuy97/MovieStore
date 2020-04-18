//
//  UserInfoTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var userImgIcon: UIImageView!
    @IBOutlet weak var userValue: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
