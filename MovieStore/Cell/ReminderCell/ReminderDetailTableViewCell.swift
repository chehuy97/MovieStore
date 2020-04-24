//
//  ReminderDetailTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/23/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class ReminderDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var imgMovie: UIImageView!
    @IBOutlet weak var nameMovie: UILabel!
    @IBOutlet weak var timeMovie: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
