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
    var showPicker:Bool = false
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @IBAction func showPickerDidTap(_ sender: Any) {
//        self.performSegue(withIdentifier: "adadas", sender: nil)
//        
    

}
