//
//  TabBarController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit
class TabBarController: UITabBarController, ChangeViewControllerDelegate{
    var changeViewControllerDelegate:ChangeViewControllerDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeUI()
        // Do any additional setup after loading the view.
    }
    func customizeUI(){
        tabBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        tabBar.isTranslucent = false
        tabBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        //        self.navigationItem.title = "The title"
        //        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
    func changeViewController() {
        self.selectedIndex = 2
        let vcNav = self.selectedViewController as! UINavigationController
        let vc = vcNav.viewControllers[0] as! SettingViewController
        self.changeViewControllerDelegate = vc
        self.changeViewControllerDelegate.changeViewController()
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
