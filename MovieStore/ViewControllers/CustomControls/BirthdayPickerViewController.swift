//
//  BrirthayPickerViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/22/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class BirthdayPickerViewController: UIViewController{
    
    @IBOutlet weak var dateYearPicker: UIDatePicker!
    @IBOutlet weak var chooseView: UIView!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    var pickerDelegate:PickerDelegate!
    var selectedDate:String!
    var dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        // Do any additional setup after loading the view.
    }
    
    func customizeUI() {
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateYearPicker.backgroundColor = UIColor.white
        dateYearPicker.layer.cornerRadius = 10
        dateYearPicker.layer.masksToBounds = true
        chooseView.layer.cornerRadius = 10
        cancelBtn.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
        selectBtn.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
    }
    
    @IBAction func dateChanged(_ sender: Any) {
        selectedDate = dateFormatter.string(from: dateYearPicker.date)
    }
    
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectButtonDidTap(_ sender: Any) {
        self.pickerDelegate.selectPickerTime(time: selectedDate)
        self.dismiss(animated: true, completion: nil)
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
