//
//  CourseProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class CourseProfileViewController: UIViewController {

    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseName: UILabel!
    @IBOutlet weak var courseTime: UILabel!
    @IBOutlet weak var courseDate: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var coursePlace: UILabel!
    @IBOutlet weak var courseDescription: UITextView!
    @IBOutlet weak var courseOffer: UILabel!
    
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
        courseName.text =   myCourse!.courseName
        courseDate.text = myCourse!.courseDate
        courseTime.text = myCourse!.courseTime
        coursePlace.text = myCourse!.coursePlace
        courseDescription.text = myCourse!.courseDescription
        courseOffer.text = myCourse!.courseOffer
        coursePrice.text = myCourse!.coursePlace
        
        let url = URL(string: (myCourse!.courseImage)!)
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.courseImg.image = image
                self.courseImg.kf.indicatorType = .activity
            }
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""

    }

}
