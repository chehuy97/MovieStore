//
//  ViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit
import SWRevealViewController

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var filmTable: UITableView!
    @IBOutlet weak var filmGrid: UICollectionView!
    @IBOutlet weak var switchViewBtn: UIBarButtonItem!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    var viewDisplay:Bool = true
    var homeData: [MovieListModel] = []
    var movieIdDelegate:MovieIdDelegate!
    var settingFitter:Int = 0
    var settingSortBy:Int = 2
    var settingRating:Float = 0.0
    var settingReleaseYear:String = "none"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        NotificationCenter.default.addObserver(self, selector: #selector(getSettingData), name: NSNotification.Name(rawValue: "SettingUpdateNotification"), object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if settingFitter == 1 {
            self.title = "Top Rated"
        } else if settingFitter == 2 {
            self.title = "Up Coming"
        } else if settingFitter == 3 {
            self.title = "Now Playing"
        } else {
            self.title = "Popular"
        }
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        loadDataFromAPI()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHomeFilmDetail" {
            let vc:FilmDetailViewController = segue.destination as! FilmDetailViewController
            self.movieIdDelegate = vc
        }
    }
    
    func initData() {
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        filmTable.dataSource = self
        filmTable.delegate = self
        filmGrid.dataSource = self
        filmGrid.delegate = self
        filmTable.alpha = 1
        filmGrid.alpha = 0
    }
    
    func loadDataFromAPI() {
        APIService.sharedInstance.LoadHomeDataFromAPI(Filter: settingFitter, SortBy: settingSortBy, Rating: settingRating, ReleaseYear: settingReleaseYear) { (data) in
            self.homeData = data
            self.filmTable?.reloadData()
            self.filmGrid?.reloadData()
        }
    }
    
    @objc func getSettingData() {
        settingFitter = SettingData.sharedInstance.settingFiler
        settingSortBy = SettingData.sharedInstance.settingSortBy
        settingRating = SettingData.sharedInstance.settingRating
        settingReleaseYear = SettingData.sharedInstance.settingReleaseYear
        print("\(settingFitter) and \(settingSortBy) and \(settingRating) and \(settingReleaseYear)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FilmInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "filmTableCell", for: indexPath) as! FilmInfoTableViewCell
//        let cell:FilmInfoTableViewCell = tableView.cellForRow(at: indexPath) as! FilmInfoTableViewCell
        //cell.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cell.loadData(movieItem: homeData[indexPath.row])
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showHomeFilmDetail", sender: nil)
        self.movieIdDelegate.sendMovieId(Id: homeData[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.homeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FilmInfoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmGridCell", for: indexPath) as! FilmInfoCollectionViewCell
        cell.loadData(movieItem: homeData[indexPath.row])
        cell.configurateUI(View: self)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showHomeFilmDetail", sender: nil)
        self.movieIdDelegate.sendMovieId(Id: homeData[indexPath.row].id)
    }
    
    @IBAction func changeViewDisplay(_ sender: Any) {
        viewDisplay = !viewDisplay
        if viewDisplay == true {
            filmTable.alpha = 1
            filmGrid.alpha = 0
            switchViewBtn.image = UIImage.init(named: "grid")
        } else {
            filmTable.alpha = 0
            filmGrid.alpha = 1
            switchViewBtn.image = UIImage.init(named: "list")
        }
    }
    
}

