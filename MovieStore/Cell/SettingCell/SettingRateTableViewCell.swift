//
//  SettingRateTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/20/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class SettingRateTableViewCell: UITableViewCell {


    @IBOutlet weak var settingName: UILabel!
    @IBOutlet weak var rateScore: UILabel!
    @IBOutlet weak var sliderScore: UISlider!
    
    @IBAction func chooseSlider(_ sender: Any) {
//        var value:Float = 0
//        let slidervalue:Int = Int(sliderScore.value)
//        if (Float(slidervalue + 1) -  sliderScore.value > 0.5) {
//            value = Float(slidervalue)
//        } else {
//            value = Float(slidervalue) + 0.5
//        }
        let sliderValue:String! = String(format: "%.1f", sliderScore.value)
        SettingData.sharedInstance.settingRating = Float(sliderValue)!
        rateScore.text = sliderValue
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
