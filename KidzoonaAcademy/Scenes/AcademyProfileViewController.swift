//
//  AcademyProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class AcademyProfileViewController: UIViewController {

    @IBOutlet weak var paperImg: UIImageView!
    @IBOutlet weak var academyName: UILabel!
    @IBOutlet weak var academyImg: UIImageView!
    @IBOutlet weak var websiteLbl: UILabel!
    @IBOutlet weak var LocationLbl: UILabel!
    @IBOutlet weak var PhoneLbl: UILabel!
    override func viewWillAppear(_ animated: Bool) {
        displayAcademy()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        

        // Do any additional setup after loading the view.
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)

    }
    
    func displayAcademy(){
        let academy = Academy.decodeAcademy()
        print("in final img url = \(academy.img)")
        print("IN upload \(academy.email)")
        print("Academy Name="+academy.name)
        print("Academy phone="+academy.phone)
        PhoneLbl.text = academy.phone
        LocationLbl.text = academy.location
        academyName.text = academy.name
        websiteLbl.text = academy.email
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
    
}
