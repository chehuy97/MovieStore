//
//  FavoriteMovieData.swift
//  MovieStore
//
//  Created by Arthur on 4/29/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

class FavoriteMovieData {
    static let sharedInstance = FavoriteMovieData()
    
    private init() {}
    
    var favoriteData:[MovieListModel] = []
    
}
