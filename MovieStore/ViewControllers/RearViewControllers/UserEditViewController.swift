//
//  UserEditViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/21/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class UserEditViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate,PickerDelegate {
    
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var imageUser: UIButton!
    @IBOutlet weak var textfieldName: UITextField!
    @IBOutlet weak var infoTable: UITableView!
    var selectedDate:String!
    let imagePicker = UIImagePickerController()
    var birthdayPicker:IndexPath!
    var userInfoDelegate: UserInfoDelegate!
    
    var imgUSer:UIImage!
    var nameUser:String = "John Marker"
    var birthdayUser:String = "1970-01-01"
    var mailUser:String = "johnmarker@gmail.com"
    var genderUser:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        dataInit()
        // Do any additional setup after loading the view.
    }
    //    override func viewWillAppear(_ animated: Bool) {
    //        //imageUser.setImage(imgUSer, for: .normal)
    //        textfieldName.text = nameUser
    //    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserBirthdayPicker" {
            let vc:BirthdayPickerViewController = segue.destination as! BirthdayPickerViewController
            vc.pickerDelegate = self
        }
        //        if segue.identifier == "menuSegue" {
        //            let vc:MenuViewController = segue.destination as! MenuViewController
        //            vc.userInfoMenuDelegate = self
        //        }
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
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell:UserInfoBirthdayTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoBirthdayCell") as! UserInfoBirthdayTableViewCell
            cell.userImgIcon.image = UIImage.init(named: "birthday")
            //cell.dateYearBtn.titleLabel?.text = birthdayUser
            cell.dateYearBtn.contentHorizontalAlignment = .left
            birthdayPicker = indexPath
            return cell
        }
        if indexPath.row == 1 {
            let cell:UserInfoMailTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoMailCell") as! UserInfoMailTableViewCell
            cell.userImgIcon.image = UIImage.init(named: "mail")
            cell.nameMail.text = mailUser
            return cell
        }
        if indexPath.row == 2 {
            let cell:UserInfoGenderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "userInfoGenderCell") as! UserInfoGenderTableViewCell
            cell.gender = genderUser
            cell.userImgIcon.image = UIImage.init(named: "user")
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let cell:UserInfoBirthdayTableViewCell = infoTable.cellForRow(at: indexPath) as! UserInfoBirthdayTableViewCell
            birthdayUser = cell.dateYearBtn.titleLabel?.text ?? "uf"
        }
        if indexPath.row == 1 {
            let cell:UserInfoMailTableViewCell = infoTable.cellForRow(at: indexPath) as! UserInfoMailTableViewCell
            mailUser = cell.nameMail.text ?? "eiruy"
        }
        if indexPath.row == 2 {
            let cell:UserInfoGenderTableViewCell = infoTable.cellForRow(at: indexPath) as! UserInfoGenderTableViewCell
            genderUser = cell.gender
        }
    }
    
    @IBAction func cancelEditUSer(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func doneEditUSer(_ sender: Any) {
        //        self.userInfoDelegate.passUserData(userImg: imgUSer ?? 1, userName: nameUser, userBirthday: birthdayUser, userMail: mailUser, userGender: genderUser)
        //        self.performSegue(withIdentifier: "menuSegue", sender: nil)
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
    // user info delegate
    //    func passUserData(userImg: Any, userName: String, userBirthday: String, userMail: String, userGender: Bool) {
    //        imgUSer = userImg as? UIImage
    //        nameUser = userName
    //        birthdayUser = userBirthday
    //        mailUser = userMail
    //        genderUser = userGender
    //    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
