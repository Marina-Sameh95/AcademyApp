//
//  CourseProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CourseProfileViewController: UIViewController {

    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseImg: UIImageView!
    
    var getCourseName = String()
    var getCourseImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        courseName.text! = getCourseName
        courseImg.image = getCourseImg
        self.navigationController?.isNavigationBarHidden = true

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
