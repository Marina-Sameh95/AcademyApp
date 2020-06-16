//
//  CourseProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher
import Cosmos

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
    
    var name: NSArray = []
    var date: NSArray = []
    var rateView: CosmosView!
    
    @IBAction func backBtn(_ sender: Any) {
        
self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func editCourse(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EditCourse", bundle: nil)
        performSegue(withIdentifier: "toEditCourse", sender:myCourse)
//        let courseList = UIStoryboard(name: "EditCourse", bundle: nil).instantiateViewController(withIdentifier: "EditCourse")
//        self.navigationController?.pushViewController(courseList, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toEditCourse"){
            let editCourseVC = segue.destination as! EditCourse
            editCourseVC.myCourse = sender as? Course
        }
    }
    
   var myCourse : Course?
    
    override func viewDidLoad() {
        super.viewDidLoad()



       self.navigationController?.isNavigationBarHidden = true
        
        name = ["Ali","Kero","Mark","Mahmoud","Marwan","Asmaa","Marwa","Hager"]
        date = ["1/6/2020", "5/6/2020", "10/6/2020", "12/6/2020","3/6/2020","11/6/2020","14/6/2020","2/6/2020"]

        
       // print("courseName=" + myCourse!.courseName ?? "")
        courseName.text =   myCourse!.courseName
        courseDate.text = myCourse!.courseDate
        courseTime.text = myCourse!.courseTime
        coursePlace.text = myCourse!.coursePlace
        courseDescription.text = myCourse!.courseDescription
        courseOffer.text = myCourse!.courseOffer
        coursePrice.text = myCourse!.coursePrice + " LE"
        
        let url = URL(string: (myCourse!.courseImage))
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.courseImg.image = image
                self.courseImg.kf.indicatorType = .activity
            }
        }
    }
    @IBAction func toCourseProfile(_ unwindSegue: UIStoryboardSegue){}
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        self.navigationController?.isNavigationBarHidden = true
        
    }

}
extension CourseProfileViewController : UITableViewDelegate , UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reviewCell", for: indexPath) as! ReviewCourseTableViewCell
        cell.contentView.backgroundColor = UIColor (white: 0.95, alpha: 1)
        cell.rateView = [indexPath.row] as? CosmosView
        cell.reviewDate.text = date[indexPath.row] as? String
        cell.userName.text = name[indexPath.row] as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
