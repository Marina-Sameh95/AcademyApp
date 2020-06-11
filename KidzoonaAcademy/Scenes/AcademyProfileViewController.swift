//
//  AcademyProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase

class AcademyProfileViewController: UIViewController {
    var academy = Academy()
    @IBOutlet weak var paperImg: UIImageView!
    @IBOutlet weak var academyName: UILabel!
    @IBOutlet weak var academyImg: UIImageView!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var PhoneLbl: UILabel!
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveProfileData()
        displayAcademy()

        self.navigationController?.isNavigationBarHidden = true
        
        

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    func retrieveProfileData(){
        let aID = Auth.auth().currentUser?.uid
        let query = Database.database().reference().child("Academies").child(aID!).child("Information").queryLimited(toLast: 10)
        _ = query.observe(.value, with: { [weak self] snapshot in
            if let info = snapshot.value as? [String:Any]{
                print("info= \(info)")
                let name = info["name"] as? String
                let phone = info["phone"] as? String
                let password = info["password"] as? String
                let email = info["email"] as? String
                let img = info["image"] as? String
                let location = info["location"] as? String
                let paper = info["papers"] as? String
                let URL = info["URL"] as? String
                print("URL=\(URL)")
                self?.academy = Academy(name: name!, phone: phone!, location: location!, img: img!, papers: paper!,URL:URL ?? "",email:email!,password:password!)
                self?.displayAcademy()
                
        
            }})

    }

    @IBAction func editBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "toEditAcademy", sender: academy)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toEditAcademy"){
            let editAcademyVC = segue.destination as! EditAcademy
            editAcademyVC.academy = sender as? Academy
        }
    }
    
    func displayAcademy(){
        print("in final img url = \(academy.img)")
        print("IN upload \(academy.email)")
        print("Academy Name="+academy.name)
        print("Academy phone="+academy.phone)
        PhoneLbl.text = academy.phone
        LocationLbl.text = academy.location
        academyName.text = academy.name
        if (academy.URL == ""){
            websiteLbl.text = "-------"
        }
        else{
        websiteLbl.text = academy.URL
        }
        let url = URL(string: (academy.img))
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.academyImg.image = image
                self.academyImg.kf.indicatorType = .activity
            }
        }
        let urlPaper = URL(string: (academy.papersURL))
        if let url = urlPaper as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.paperImg.image = image
                self.paperImg.kf.indicatorType = .activity
            }
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
    
    @IBAction func toAcademyProfile (_ unwindSegue: UIStoryboardSegue){}

}
