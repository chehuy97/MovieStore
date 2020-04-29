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
    
    func loadData(cast:CastCrewModel){
        imgActor.loadImage(url: URL(string: cast.castImage)!)
        nameActor.text = cast.catsName
    }
    
    func configurateUI(){
        imgActor.image = UIImage.init(named: "actor")
        self.heightAnchor.constraint(equalToConstant: 120).isActive = true
        self.widthAnchor.constraint(equalToConstant: 95).isActive = true
        
    }
}
