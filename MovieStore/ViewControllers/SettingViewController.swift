//
//  SettingViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/17/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit
import SWRevealViewController

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, PickerDelegate {
    

    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    var settingListFilter:[String]!
    var settingListSortBy:[String]!
    var selectItem:Bool = false
    var previousFilterIndex:IndexPath?
    var previousSortByIndex:IndexPath?
    var selectedTime:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataInit()
        btnMenu.target = revealViewController()
        btnMenu.action = #selector(SWRevealViewController.revealToggle(_:))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Setting"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = UIColor.init(red: 85/255, green: 100/255, blue: 185/255, alpha: 1)
        navigationController?.navigationBar.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    }
    func dataInit() {
//        let yearPicker = YearPickerViewController()
//        yearPicker.pickerDelegate = self
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingListFilter = ["Popular Movies", "Top Rate Movies", "Upcoming Movies", "NowPlaying Movies","Movie with rate from:", "Release Year"]
        settingListSortBy = ["Release Date", "Rating"]
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0  {
            return "Filter"
        }
        if section == 1 {
            return "Sort By"
        }
        return "Section"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return settingListFilter.count
        }
        if section == 1 {
            return settingListSortBy.count
        }
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 4 {
                let cell:SettingRateTableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingRateCell") as! SettingRateTableViewCell
                cell.settingName.text = settingListFilter[indexPath.row]
                return cell
            }
            if indexPath.row == 5 {
                let cell:SettingReleaseYearTableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingYearCell") as! SettingReleaseYearTableViewCell
                cell.settingName.text = settingListFilter[indexPath.row]
                return cell
            }
            let cell:SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingCell")! as! SettingTableViewCell
            cell.settingName.text = settingListFilter[indexPath.row]
            return cell
            
        }
        if indexPath.section == 1 {
            let cell:SettingTableViewCell = tableView.dequeueReusableCell(withIdentifier: "settingCell") as! SettingTableViewCell
            cell.settingName.text = settingListSortBy[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 4 {
            return 120
        }
        
        return 60
    }
    @IBAction func openPicker(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "YearPickerViewController") as! YearPickerViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.pickerDelegate = self
        present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if previousFilterIndex != nil {
                let cell:SettingTableViewCell = tableView.cellForRow(at: previousFilterIndex!) as! SettingTableViewCell
                cell.checkImg.image = UIImage.init(named: "")
            }
        }
        if indexPath.section == 1 {
            if previousSortByIndex != nil {
                let cell:SettingTableViewCell = tableView.cellForRow(at: previousSortByIndex!) as! SettingTableViewCell
                cell.checkImg.image = UIImage.init(named: "")
            }
        }
        if !((indexPath.section == 0 && indexPath.row == 4) || (indexPath.section == 0 && indexPath.row == 5)) {
            let cell:SettingTableViewCell = tableView.cellForRow(at: indexPath) as! SettingTableViewCell
            cell.checkImg.image = UIImage.init(named: "correct")
            if(indexPath.section == 0 ){
                previousFilterIndex = indexPath
            } else {
                previousSortByIndex = indexPath
            }
        } else if (indexPath.section == 0 && indexPath.row == 5) {

        }else {

        }
    }
    //Picker Delegate
    func selectPickerTime(time: String) {
        selectedTime = time
        print(selectedTime!)
        print("OK")
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
