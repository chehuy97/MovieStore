//
//  MovieDetailModel.swift
//  MovieStore
//
//  Created by Arthur on 4/28/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import Foundation

struct MovieDetailModel {
    var id:String!
    var title:String!
    var releaseDate:String
    var rating:Float!
    var overview:String
    var imgMovie:String!
    var production:[CastCrewModel]!
}
