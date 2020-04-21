//
//  YearPickerViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/20/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class YearPickerViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var chooseView: UIView!
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSelect: UIButton!
    var pickerDelegate:PickerDelegate?
    //var yearPickerData:[String]!
    var yearPickerData:[String] = ["1990", "1991", "1992", "1993", "1994", "1995", "1996", "1997", "1998", "1999", "2000", "2001", "2002", "2003", "2004", "2005", "2006", "2007"]
    var selectYear:String!
    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        customizeUI()
        // Do any additional setup after loading the view.
    }
    func initData() {
//        for a in 1970...2020{
//            yearPickerData.append("\(a)")
//        }
        selectYear = yearPickerData[0]
    }
    func customizeUI(){
       // self.view.backgroundColor = UIColor.clear
        yearPicker.delegate = self
        yearPicker.dataSource = self
        yearPicker.layer.cornerRadius = 10
        
        chooseView.layer.cornerRadius = 10
        btnCancel.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
        btnSelect.widthAnchor.constraint(equalToConstant: chooseView.frame.width/2).isActive = true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            1
        }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            yearPickerData.count
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            yearPickerData[row]
        }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return 40
        }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print(yearPickerData[row])
            selectYear = yearPickerData[row]
        }
    @IBAction func cancelButtonDidTap(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func selectButtonDidTap(_ sender: Any) {
        print("select is \(selectYear!)")
        self.pickerDelegate?.selectPickerTime(time: selectYear)
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
