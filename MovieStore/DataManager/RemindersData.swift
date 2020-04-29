//
//  RemindersData.swift
//  MovieStore
//
//  Created by Arthur on 4/29/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

class RemindersData {
    
    static let sharedInstance = RemindersData()
    
    private init() {}
    
    var remindersData:[ReminderModel] = []
    
}
