//
//  FilmInfoTableViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class FilmInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var imgFilm: UIImageView!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var ratingFilm: UILabel!
    @IBOutlet weak var overviewFilm: UILabel!
    @IBOutlet weak var selectedFavorite: UIButton!
    var favotiteSelected = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configurateUI() {
        imgFilm.image = UIImage.init(named: "filmImage")
    }
    
    @IBAction func favoriteSelected(_ sender: Any) {
        favotiteSelected = !favotiteSelected
        if favotiteSelected == true {
            selectedFavorite.setImage(UIImage.init(named: "star-selected"), for: .normal)
        } else {
            selectedFavorite.setImage(UIImage.init(named: "star"), for: .normal)
        }
    }
}