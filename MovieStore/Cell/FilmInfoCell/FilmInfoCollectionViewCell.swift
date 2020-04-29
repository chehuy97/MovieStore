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
    
    func configurateUI(View uiView:UIViewController) {
        movieName.font = UIFont.boldSystemFont(ofSize: 20)
        self.heightAnchor.constraint(equalToConstant: uiView.view.frame.height/3 + 5).isActive = true
        self.widthAnchor.constraint(equalToConstant: uiView.view.frame.width/2-10).isActive = true
        self.filmImage.heightAnchor.constraint(equalToConstant: uiView.view.frame.height/4).isActive = true
        self.filmImage.widthAnchor.constraint(equalToConstant: uiView.view.frame.width-30).isActive = true
    }
}

