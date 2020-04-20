//
//  CastCollectionViewCell.swift
//  MovieStore
//
//  Created by Arthur on 4/18/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class CastCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgActor: UIImageView!
    @IBOutlet weak var nameActor: UILabel!
    
    func configurateUI(){
        imgActor.image = UIImage.init(named: "actor")
        nameActor.text = "Chris Evans"
        self.heightAnchor.constraint(equalToConstant: 160).isActive = true
        self.widthAnchor.constraint(equalToConstant: 180).isActive = true
    }
}
