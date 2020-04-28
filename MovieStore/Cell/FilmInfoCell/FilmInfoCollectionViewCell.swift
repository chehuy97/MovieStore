//
//  FilmInfoCollectionViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/21/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class FilmInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filmImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    func loadData(movieItem: MovieListModel){
        filmImage.loadImage(url: URL(string: movieItem.imgMovieURL)!)
        movieName.text = movieItem.title
    }
    
    func configurateUI() {
        self.filmImage.image = UIImage.init(named: "filmImage")
    }
}

