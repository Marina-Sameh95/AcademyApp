//
//  HomeVC.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import UserNotifications

class HomeVC: UIViewController {

    
    @IBAction func blog1Btn(_ sender: Any) {
        
        let blogOne = UIStoryboard(name: "Blog1", bundle: nil).instantiateViewController(withIdentifier: "BlogOne")
    
              self.navigationController?.pushViewController(blogOne, animated: true)
        
    }
    
    
    @IBAction func blog2Btn(_ sender: Any) {
        
        let blogOne = UIStoryboard(name: "BlogTwo", bundle: nil).instantiateViewController(withIdentifier: "BlogTwo")
        
        self.navigationController?.pushViewController(blogOne, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        
         navigationController?.navigationBar.barTintColor = UIColor(red: 149/255 , green: 135/255 , blue: 202/255 , alpha: 1)
        
        UNUserNotificationCenter.current().delegate = self
        
       notify()
   
    }
    
    func notify(){
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "Welcome"
        content.body = "Welcome to Kidzoona let's start our journey"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 2.0, repeats: false)
        
        let request = UNNotificationRequest(identifier: "reminder", content: content, trigger: trigger)
        
        center.add(request){(error) in
            if error != nil {
                print("Error = \(error?.localizedDescription ?? "error local notification")")
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Home"
        navigationController?.isNavigationBarHidden = false
        
    }
        

}

extension HomeVC : UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
}
    

