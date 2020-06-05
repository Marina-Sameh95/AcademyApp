//
//  CourseListViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CourseListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    var names: NSArray = []
    var imageArr: NSArray = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        names = ["Wedo","EV3","Art","Drawing","Music","Music","chess"]
        imageArr = [UIImage(named: "course1"),UIImage(named: "course2"),UIImage(named: "course3"),UIImage(named: "course4"),UIImage(named: "course5"),UIImage(named: "course6"),UIImage(named: "course7")!]
        
        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        
    }


}

extension CourseListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CourseCellTableViewCell
        cell.contentView.backgroundColor = UIColor (white: 0.95, alpha: 1)
      //  cell.courseImg.image = imageArr[indexPath.row] as! UIImage
        cell.courseName.text! = names[indexPath.row] as! String
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let Storyboard = UIStoryboard(name: "Course", bundle: nil)
        let courseProfile = Storyboard.instantiateViewController(withIdentifier:"courserProfile") as! CourseProfileViewController
        
        courseProfile.getCourseImg = imageArr [indexPath.row] as! UIImage
        courseProfile.getCourseName = names[indexPath.row] as! String
        self.navigationController?.pushViewController(courseProfile, animated: true)
        
    }
    
}
