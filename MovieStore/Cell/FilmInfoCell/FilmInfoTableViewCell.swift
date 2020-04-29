//
//  FilmInfoTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit


class FilmInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratingFilm: UILabel!
    @IBOutlet weak var overviewFilm: UILabel!
    @IBOutlet weak var selectedFavorite: UIButton!
    var favoriteStatus = false
    var cellMovieItem:MovieListModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func loadData(movieItem:MovieListModel) {
        cellMovieItem = movieItem
        movieName.text = cellMovieItem.title
        releaseDate.text = cellMovieItem.releaseDate
        ratingFilm.text = String(cellMovieItem.rating) + "/10"
        overviewFilm.text = movieItem.overview
        imgFilm.loadImage(url: URL(string: cellMovieItem.imgMovieURL)!)
        configurateUI()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configurateUI() {
        movieName.font = UIFont.boldSystemFont(ofSize: 20)
        // đoạn ni phải check với cái list favorite nề //y la chon sao dau lq den list favorite t chon roi t ms add vo favorite ma
        let mvs =  FavoriteMovieData.sharedInstance.favoriteData.filter { (m) -> Bool in
            return m.id == cellMovieItem!.id
        }
        if mvs.count > 0 {
            selectedFavorite.setImage(UIImage.init(named: "star-selected"), for: .normal)
        } else {
            selectedFavorite.setImage(UIImage.init(named: "star"), for: .normal)
        }
    }
    
    @IBAction func selectFavoriteButtonDidTap(_ sender: UIButton) {
        favoriteStatus = !favoriteStatus
        if favoriteStatus == true {
            sender.setImage(UIImage.init(named: "star-selected"), for: .normal)
            FavoriteMovieData.sharedInstance.favoriteData.append(cellMovieItem) //cho ni ne
        } else {
            sender.setImage(UIImage.init(named: "star"), for: .normal)
            FavoriteMovieData.sharedInstance.favoriteData.removeAll{$0.id == cellMovieItem.id}
        }
    }
}

