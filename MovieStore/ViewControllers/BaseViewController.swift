//
//  BaseViewController.swift
//  MovieStore
//
//  Created by Arthur on 4/23/20.
//  Copyright © 2020 Arthur. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    func showAlert(alertString:String){
        // create the alert
        let alert = UIAlertController(title: nil, message: alertString, preferredStyle: UIAlertController.Style.alert)
        
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (alert: UIAlertAction!) in print("haha")}))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    func notification(Title title:String, Body body:String, Time time:TimeInterval) {
        //step1: Ask for permission
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { (granted, error) in
        }
        //step2: Create the notification content
        
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        
        //step3: Create the notification trigger
        let date = Date().addingTimeInterval(time)
        let dateComponents = Calendar.current.dateComponents([.year, .month,.day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        //Step 4: Create the request
        
        let uuiString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuiString, content: content, trigger: trigger)
        
        //step 5: register the request
        center.add(request) { (error) in
            //checked the erro parameter and handle any error
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
