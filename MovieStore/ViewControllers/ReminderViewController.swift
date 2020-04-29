//
//  ReminderViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/23/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var reminderTable: UITableView!
    var remindersData:[ReminderModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "All Reminders"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        remindersData = RemindersData.sharedInstance.remindersData
    }

    func dataInit() {
        reminderTable.delegate = self
        reminderTable.dataSource = self
        self.reminderTable.allowsMultipleSelectionDuringEditing = false
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.remindersData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell") as! ReminderDetailTableViewCell
        cell.loadData(item: remindersData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            //add code here for when you hit delete
            RemindersData.sharedInstance.remindersData.removeAll(where: {$0.timeReminder == remindersData[indexPath.row].timeReminder})
            remindersData = RemindersData.sharedInstance.remindersData
            self.reminderTable?.reloadData()
        }
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
