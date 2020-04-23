//
//  UserEditViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/21/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, PickerDelegate{
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var imageUser: UIButton!
    @IBOutlet weak var infoTable: UITableView!
    var listUSerInforImage:[String]!
    var selectedDate:String!
    let imagePicker = UIImagePickerController()
    var birthdayPicker:IndexPath!
    var userInfoDelegate: UserInfoDelegate!
    
    var imgUSer:UIImage!
    var nameUser:String!
    var birthdayUser:String!
    var mailUser:String!
    var genderUser:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        dataInit()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserBirthdayPicker" {
            let vc:BirthdayPickerViewController = segue.destination as! BirthdayPickerViewController
            vc.pickerDelegate = self
        }
    }
    
    func customizeUI() {
        cancelBtn.backgroundColor = UIColor.init(red: 31/255, green: 188/255, blue: 188/255, alpha: 1)
        cancelBtn.layer.cornerRadius = 10
        doneBtn.backgroundColor = UIColor.init(red: 5/255, green: 122/255, blue: 255/255, alpha: 1)
        doneBtn.layer.cornerRadius = 10
        imageUser.imageView?.layer.cornerRadius = imageUser.bounds.height/2
        //        imagePicker.navigationBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        //        imagePicker.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.yellow]
        //        imagePicker.navigationBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    func dataInit(){
        infoTable.delegate = self
        infoTable.dataSource = self
        imagePicker.modalPresentationStyle = .overFullScreen
        imagePicker.delegate = self
        listUSerInforImage = ["birthday","mail","user"]
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listUSerInforImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:UserInfoBirthdayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoBirthdayCell") as! UserInfoBirthdayTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            cell.dateYearBtn.contentHorizontalAlignment = .left
            birthdayPicker = indexPath
            return cell
        }
        if indexPath.row == 1 {
            let cell:UserInfoMailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoMailCell") as! UserInfoMailTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            return cell
        }
        if indexPath.row == 2 {
            let cell:UserInfoGenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoGenderCell") as! UserInfoGenderTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cell:UserInfoBirthdayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoBirthdayCell") as! UserInfoBirthdayTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
            cell.dateYearBtn.contentHorizontalAlignment = .left
            birthdayPicker = indexPath
        }
        if indexPath.row == 1 {
            let cell:UserInfoMailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoMailCell") as! UserInfoMailTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
        }
        if indexPath.row == 2 {
            let cell:UserInfoGenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoGenderCell") as! UserInfoGenderTableViewCell
            cell.userImgIcon.image = UIImage.init(named: listUSerInforImage[indexPath.row])
        }
    }
    
    @IBAction func cancelEditUSer(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneEditUSer(_ sender: Any) {
        self.userInfoDelegate.passUserData(userImg: imgUSer ?? 1, userName: nameUser, userBirthday: birthdayUser, userMail: mailUser, userGender: (genderUser != nil))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func chooseAvatar(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    //choose image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageUser.imageView?.contentMode = .scaleAspectFit
            imageUser.setImage(pickedImage, for: .normal)
            imgUSer = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectBirthday(_ sender: Any) {
        self.performSegue(withIdentifier: "showUserBirthdayPicker", sender: nil)
    }
    
    //picker delegate
    func selectPickerTime(time: String) {
        let cell:UserInfoBirthdayTableViewCell = infoTable.cellForRow(at: birthdayPicker) as! UserInfoBirthdayTableViewCell
        cell.selectDate(date: time)
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
