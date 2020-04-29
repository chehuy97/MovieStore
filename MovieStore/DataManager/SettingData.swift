//
//  SettingData.swift
//  MovieStore
//
//  Created by Arthur on 4/28/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

class SettingData {
    static let sharedInstance = SettingData()
    
    private init() { }
    
    let settingUpdateNotification = "SettingUpdateNotification"
    
    var settingFiler:Int = 0 {
        didSet{
            NotificationCenter.default.post(name:
            NSNotification.Name(rawValue: settingUpdateNotification), object: nil)
        }
    }
    var settingSortBy:Int = 2 {
        didSet{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: settingUpdateNotification), object: nil)
        }
    }
    
    var settingRating:Float = 3.0 {
        didSet{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: settingUpdateNotification), object: nil)
        }
    }
    
    var settingReleaseYear:String = "none" {
        didSet{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: settingUpdateNotification), object: nil)
        }
    }
    

}
