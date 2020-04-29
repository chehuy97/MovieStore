//
//  SettingStatusDelegate.swift
//  MovieStore
//
//  Created by Arthur on 4/28/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

protocol SettingStatusDelegate {
    func sendFilterAndSortByStatus(Filter filter:Int, SortBy sortBy:Int)
}
