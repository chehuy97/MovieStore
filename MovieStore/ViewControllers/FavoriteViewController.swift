//
//  FavoriteViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit
import SWRevealViewController

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var filmTable: UITableView!
    @IBOutlet weak var filmGrid: UICollectionView!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var switchViewBtn: UIBarButtonItem!
    var viewDisplay:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Favorite Film"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FilmInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "filmTableCell") as! FilmInfoTableViewCell
        //cell.heightAnchor.constraint(equalToConstant: 300).isActive = true
        cell.configurateUI()
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 230
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showFavoriteFilmDetail", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:FilmInfoCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmGridCell", for: indexPath) as! FilmInfoCollectionViewCell
        cell.configurateUI()
        cell.heightAnchor.constraint(equalToConstant: self.view.frame.height/3 + 5).isActive = true
        cell.widthAnchor.constraint(equalToConstant: self.view.frame.width/2-10).isActive = true
        cell.filmImage.heightAnchor.constraint(equalToConstant: self.view.frame.height/4).isActive = true
        cell.filmImage.widthAnchor.constraint(equalToConstant: self.view.frame.width-30).isActive = true
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "showHomeFilmDetail", sender: nil)
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
