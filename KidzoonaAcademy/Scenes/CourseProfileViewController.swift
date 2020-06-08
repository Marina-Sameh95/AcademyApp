//
//  CourseProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CourseProfileViewController: UIViewController {

    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseTime: UILabel!
    @IBOutlet weak var courseDate: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var coursePlace: UILabel!
    @IBOutlet weak var courseDescription: UITextView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func backBtn(_ sender: Any) {
        
        
    }
    
   var myCourse : Course?
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()


//        courseName.text! = getCourseName
//        courseImg.image = getCourseImg
       self.navigationController?.isNavigationBarHidden = true
        
        print("courseName=" + myCourse!.courseName ?? "")
        name = courseName.text!
        name =   myCourse!.courseName
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""

    }

}
