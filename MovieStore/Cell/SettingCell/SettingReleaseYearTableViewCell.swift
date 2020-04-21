//
//  SettingReleaseYearTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/20/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class SettingReleaseYearTableViewCell: UITableViewCell {

    @IBOutlet weak var settingName:UILabel!
    @IBOutlet weak var selectedYear: UIButton!
    
    func selectYear(time: String) {
        selectedYear.setTitle(time, for: .normal)
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
