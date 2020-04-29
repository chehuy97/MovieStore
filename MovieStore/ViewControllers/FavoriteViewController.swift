//
//  FavoriteViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit
import SWRevealViewController

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filmTable: UITableView!
    @IBOutlet weak var filmGrid: UICollectionView!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var switchViewBtn: UIBarButtonItem!
    var viewDisplay:Bool = true
    var favoriteData:[MovieListModel] = []
    var favoriteSearchData:[MovieListModel] = []
    var movieIdDelegate:MovieIdDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFavoriteFilmDetail" {
            let vc:FilmDetailViewController = segue.destination as! FilmDetailViewController
            self.movieIdDelegate = vc
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Favorites"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        loadDataFromAPI()
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
        searchBar.delegate = self
    }
    
    func loadDataFromAPI() {
        favoriteData = FavoriteMovieData.sharedInstance.favoriteData
        favoriteSearchData = favoriteData
        self.filmTable?.reloadData()
        self.filmGrid?.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            favoriteSearchData = favoriteData
        } else {
            favoriteSearchData = favoriteData.filter({ (result) -> Bool in
                return result.title.lowercased().contains(searchText.lowercased())
            })
        }
        self.filmTable?.reloadData()
        self.filmGrid?.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.favoriteSearchData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FilmInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "filmTableCell") as! FilmInfoTableViewCell
        //cell.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cell.selectedFavorite.isHidden = true
        cell.loadData(movieItem: favoriteSearchData[indexPath.row])
        cell.configurateUI()
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showFavoriteFilmDetail", sender: nil)
        self.movieIdDelegate.sendMovieId(Id: favoriteSearchData[indexPath.row].id)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.favoriteSearchData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FilmInfoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmGridCell", for: indexPath) as! FilmInfoCollectionViewCell
        cell.configurateUI(View: self)
        cell.loadData(movieItem: favoriteSearchData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showFavoriteFilmDetail", sender: nil)
        self.movieIdDelegate.sendMovieId(Id: favoriteSearchData[indexPath.row].id)
    }
    
    @IBAction func switchViewDisplay(_ sender: Any) {
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
