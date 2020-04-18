//
//  MenuViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userInfoTable: UITableView!
    @IBOutlet weak var reminderTable: UITableView!
    @IBOutlet weak var showAllBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    var listUSerInforImage:[String]!
    var listUSerInforValue:[String]!
    var listReminder:[String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        dataInit()
        userInfoTable.dataSource = self
        reminderTable.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    func customizeUI(){
        self.revealViewController()?.rearViewRevealWidth = 350
        editBtn.layer.cornerRadius = 10
        editBtn.backgroundColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        showAllBtn.layer.cornerRadius = 10
        showAllBtn.backgroundColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        userName.font = UIFont.boldSystemFont(ofSize: 30)
        
    }
    func dataInit(){
        listUSerInforImage = ["birthday","mail","user"]
        listUSerInforValue = ["1970-01-01","johnmarker@gmail.com","Male"]
        listReminder = ["The Dark Tower - 2017 - 5.6/10 2017 - 09 -03 10:06","Annabelle: Creation - 2017 6.4/10 2017-09-03 10:06"]
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 0 {
            return listUSerInforImage.count
        }
        if tableView.tag == 1 {
            return listReminder.count
        }
        return 0;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 0 {
            print("table 1 \(indexPath.row)")
            let cell:UserInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell") as! UserInfoTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            cell.userValue.text = listUSerInforValue[indexPath.row]
            return cell
        }
        if tableView.tag == 1 {
            print("table 2 \(indexPath.row)")
            let  cell:ReminderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "reminderCell") as! ReminderTableViewCell
            cell.reminderText.text = listReminder[indexPath.row]
            return cell
            
        }
        return UITableViewCell()
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
