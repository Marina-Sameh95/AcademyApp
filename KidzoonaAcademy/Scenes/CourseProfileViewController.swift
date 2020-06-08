//
//  CourseProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CourseProfileViewController: UIViewController {

    
//    var getCourseName = String()
//    var getCourseImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        courseName.text! = getCourseName
//        courseImg.image = getCourseImg
       self.navigationController?.isNavigationBarHidden = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""

    }

}
