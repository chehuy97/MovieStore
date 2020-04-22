//
//  UserEditViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/21/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var infoTable: UITableView!
    var listUSerInforImage:[String]!
    var listUSerInforValue:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        dataInit()
        // Do any additional setup after loading the view.
    }
    
    func customizeUI() {
        cancelBtn.backgroundColor = UIColor.init(red: 31/255, green: 188/255, blue: 188/255, alpha: 1)
        cancelBtn.layer.cornerRadius = 10
        doneBtn.backgroundColor = UIColor.init(red: 5/255, green: 122/255, blue: 255/255, alpha: 1)
        doneBtn.layer.cornerRadius = 10
    }
    func dataInit(){
        infoTable.delegate = self
        infoTable.dataSource = self
        listUSerInforImage = ["birthday","mail","user"]
        listUSerInforValue = ["1970-01-01","johnmarker@gmail.com","Male"]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return listUSerInforImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 2 {
            let cell:UserInfoGenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoGenderCell") as! UserInfoGenderTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            return cell
        } else {
            let cell:UserInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoCell") as! UserInfoTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            cell.userValue.text = listUSerInforValue[indexPath.row]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    @IBAction func cancelEditUSer(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneEditUSer(_ sender: Any) {
        
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
    
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
