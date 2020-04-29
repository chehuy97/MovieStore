//
//  FilmDetailViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/18/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class FilmDetailViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate,MovieIdDelegate {
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var castView: UICollectionView!
    @IBOutlet weak var btnFavorite: UIButton!
    var selectedFavorite:Bool = false
    var filmDetailData:MovieDetailModel!
    var movieId:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeUI()
        self.loadDataFromAPI()
        castView.delegate = self
        castView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    func loadDataFromAPI(){
        APIService.sharedInstance.loadFilmDetailFromAPI(MovieId: self.movieId) { (data) in
            self.filmDetailData = data
            self.title = self.filmDetailData.title
            self.releaseDate.text = self.filmDetailData.releaseDate
            self.rating.text = String(self.filmDetailData.rating)
            self.overview.text = self.filmDetailData.overview
            self.imageFilm.loadImage(url: URL(string: self.filmDetailData.imgMovie)!)
            self.castView?.reloadData()
        }
    }
    
    func customizeUI() {
        castView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        reminderButton.layer.cornerRadius = 10
        reminderButton.backgroundColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if filmDetailData != nil {
            return filmDetailData.production.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CastCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "actorCell", for: indexPath) as! CastCollectionViewCell
        cell.loadData(cast: filmDetailData.production[indexPath.row])
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
    
    func sendMovieId(Id id: String) {
        movieId = id
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
