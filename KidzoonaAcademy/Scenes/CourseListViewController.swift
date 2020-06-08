//
//  CourseListViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class CourseListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    var ref: DatabaseReference?
    var courseArr :[Course] = []
    var selectName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()

        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
      self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: nil, action: #selector(addCourse))
      

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        courseArr = []
        getFIRDbase()
     
    }
    
//     @objc func addCourse(){
//
//        let createCourse = UIStoryboard(name: "CreateCourse", bundle: nil).instantiateViewController(withIdentifier: "CreateCourse")
//
//        self.navigationController?.pushViewController(createCourse, animated: true)
//
//    }
    
    
    func getFIRDbase(){
        
        let aID = Auth.auth().currentUser?.uid
        let query = Database.database().reference().child("Academies").child(aID!).child("courses").queryLimited(toLast: 10)
        _ = query.observe(.value, with: {[weak self] snapshot in

            if let courseList = snapshot.value as? [String: Any]{
                print(courseList)
                let courseIds = courseList.keys
                print("id=\(courseIds)")
                for id in courseIds {
                    print(id as? String)
                    print(courseList[id])
                    let course = courseList[id] as? [String: Any]
                    let info = course?["information"] as? [String: Any]
                    let name = info?["courseName"] as? String
                    print(name)
                    let description = info?["courseDescription"] as? String
                    print(description)
                    let instructor = info?["courseInstructor"] as? String
                    print(instructor)
                    let place = info?["coursePlace"] as? String
                    print(place)
                    let price = info?["coursePrice"] as? String
                    print(price)
                    let offer = info?["courseOffer"] as? String
                    print(offer)
                    let date = info?["courseDate"] as? String
                    print(date)
                    let time = info?["courseTime"] as? String
                    print(time)
                    let availablePlace = info?["courseAvailablePlace"] as? String
                    print(availablePlace)
                    let image = info?["courseImage"] as? String
                    print(image)
                    let type = info?["courseType"] as? String
                    print(type)


                    let courseData = Course(courseName: name!, courseType: type!, courseDate: date!, courseDescription: description!, courseImage: image!, courseInstructor: instructor!, courseOffer: offer!, coursePlace: place!, coursePrice: price!, courseTime: time!, courseAvailablePlace: availablePlace!)

                    self?.courseArr.append(courseData)

                }
                self?.tableView.reloadData()

            }
        })


}
    
    
    
    

}

extension CourseListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courseArr.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseCellTableViewCell
        cell.contentView.backgroundColor = UIColor (white: 0.95, alpha: 1)
        
        cell.courseModel = courseArr [indexPath.row]

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let courseDetails = UIStoryboard(name: "Course", bundle: nil).instantiateViewController(withIdentifier: "CourseDetails")
        
        let courseDetails = UIStoryboard(name: "Course", bundle: nil)
        var selectCourse = courseArr[indexPath.row]
       performSegue(withIdentifier: "toSingleCourse", sender: selectCourse)
     //  self.navigationController?.pushViewController(courseDetails, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (segue.identifier == "toSingleCourse"){
            let sigleCourseVC = segue.destination as! CourseProfileViewController
            sigleCourseVC.myCourse = sender as! Course
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}
