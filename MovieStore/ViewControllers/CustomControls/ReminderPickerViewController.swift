//
//  ReminderPickerViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/23/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class ReminderPickerViewController: BaseViewController {

    @IBOutlet weak var reminderPicker: UIDatePicker!
    @IBOutlet weak var chooseView: UIView!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    var dateFormatter = DateFormatter()
    var selectedDateTime:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        customizeUI()
        // Do any additional setup after loading the view.
    }
    func customizeUI() {
        dateFormatter.dateFormat = "yyyy-MM-dd h:mm a"
        reminderPicker.backgroundColor = UIColor.white
        reminderPicker.layer.cornerRadius = 10
        reminderPicker.layer.masksToBounds = true
        chooseView.layer.cornerRadius = 10
        cancelBtn.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
        selectBtn.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
    }

    @IBAction func dateTimeChanged(_ sender: Any) {
        selectedDateTime = dateFormatter.string(from: reminderPicker.date)
        print("\(selectedDateTime!)")
    }
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func selectButtonDidTap(_ sender: Any) {
        self.notification(Title: "Movie Notification", Body: "Show movie notification", Time: 65)
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
