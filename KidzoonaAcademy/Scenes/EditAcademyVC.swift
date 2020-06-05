
//
//  EditAcademy.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EditAcademy: UIViewController {
    @IBOutlet weak var AvatarImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        AvatarImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 86, height: 86))
        AvatarImg.layer.cornerRadius = AvatarImg.frame.height/2
        AvatarImg.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
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
