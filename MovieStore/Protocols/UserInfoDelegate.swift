//
//  File.swift
//  MovieStore
//
//  Created by Arthur on 4/22/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

protocol UserInfoDelegate {
   func passUserData(userImg:Any, userName:String, userBirthday:String, userMail:String, userGender:Bool)

}
