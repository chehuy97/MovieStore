//
//  FilmDetailViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/18/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class FilmDetailViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate,MovieIdDelegate, PickerDelegate {
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var imageFilm: UIImageView!
    @IBOutlet weak var reminderButton: UIButton!
    @IBOutlet weak var castView: UICollectionView!
    @IBOutlet weak var btnFavorite: UIButton!
    var selectedFavorite:Bool = false
   // var reminderDateTime:String!
    var filmDetailData:MovieDetailModel!
    var movieId:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDataFromAPI()
        castView.delegate = self
        castView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showReminderTime" {
            let vc = segue.destination as! ReminderPickerViewController
            vc.pickerDelegate = self
        }
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
            self.customizeUI()
        }
    }
    
    func customizeUI() {
        castView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        reminderButton.layer.cornerRadius = 10
        reminderButton.backgroundColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        let mvs =  FavoriteMovieData.sharedInstance.favoriteData.filter { (m) -> Bool in
            return m.id == filmDetailData!.id
        }
        if mvs.count > 0 {
            btnFavorite.setImage(UIImage.init(named: "star-selected"), for: .normal)
        } else {
            btnFavorite.setImage(UIImage.init(named: "star"), for: .normal)
        }
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
            FavoriteMovieData.sharedInstance.favoriteData.append(MovieListModel(title: filmDetailData.title, releaseDate: filmDetailData.releaseDate, rating: filmDetailData.rating, overview: filmDetailData.overview, imgMovieURL: filmDetailData.imgMovie, id: filmDetailData.id))
        } else {
            btnFavorite.setImage(UIImage.init(named: "star"), for: .normal)
            FavoriteMovieData.sharedInstance.favoriteData.removeAll{$0.id == filmDetailData.id}
        }
        
    }
    
    func sendMovieId(Id id: String) {
        movieId = id
    }
    
    func selectPickerTime(time: String) {
        RemindersData.sharedInstance.remindersData.append(ReminderModel(id: filmDetailData.id, imgFilmUrl: filmDetailData.imgMovie, nameFilm: filmDetailData.title, rating: filmDetailData.rating, timeReminder: time))
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
