//
//  FilmDetailViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/18/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class FilmDetailViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var castView: UICollectionView!
    @IBOutlet weak var btnFavorite: UIButton!
    var selectedFavorite:Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeUI()
        castView.delegate = self
        castView.dataSource = self
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Film Detail"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func customizeUI() {
        castView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        imageFilm.image = UIImage.init(named: "filmImage")
        reminderButton.layer.cornerRadius = 10
        reminderButton.backgroundColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CastCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "actorCell", for: indexPath) as! CastCollectionViewCell
        cell.configurateUI()
        return cell        
    }
    
    @IBAction func reminderButtonDidTap(_ sender: Any) {
        self.performSegue(withIdentifier: "showReminderTime", sender: nil)
    }
    @IBAction func FavoriteButtonDidTap(_ sender: Any) {
        selectedFavorite = !selectedFavorite
        if selectedFavorite == true {
            btnFavorite.setImage(UIImage.init(named: "star-selected"), for: .normal)
        } else {
            btnFavorite.setImage(UIImage.init(named: "star"), for: .normal)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
