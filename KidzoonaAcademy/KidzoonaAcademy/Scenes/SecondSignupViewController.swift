//
//  SecondSignupViewController.swift
//  KidzoonaAcademy
//
//  Created by Marwan Magdy on 5/26/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class SecondSignupViewController: UIViewController {

    
    @IBOutlet weak var box1: UIButton!
    @IBOutlet weak var box2: UIButton!
    @IBOutlet weak var box3: UIButton!
    @IBOutlet weak var box4: UIButton!
    @IBOutlet weak var signupbtn: UIButton!
    
    
    @IBAction func box1(_ sender: UIButton) {
        
        if(flag1 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox")), for:UIControl.State.normal)
            flag1 = true
        }
        else {
            sender.setBackgroundImage((UIImage(named: "unchecked")), for:UIControl.State.normal)
            flag1 = false
        }
    }
    
    @IBAction func box2(_ sender: UIButton) {
        
        if(flag2 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox")), for:UIControl.State.normal)
            flag2 = true
        }
        else {
            sender.setBackgroundImage((UIImage(named: "unchecked")), for:UIControl.State.normal)
            flag2 = false
        }
    }
    
    @IBAction func box3(_ sender: UIButton) {
        
        if(flag3 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox")), for:UIControl.State.normal)
            flag3 = true
        }
        else {
            sender.setBackgroundImage((UIImage(named: "unchecked")), for:UIControl.State.normal)
            flag3 = false
        }
    }
    
    @IBAction func box4(_ sender: UIButton) {
        
        if(flag4 == false) {
            sender.setBackgroundImage((UIImage(named: "checkbox")), for:UIControl.State.normal)
            flag4 = true
        }
        else {
            sender.setBackgroundImage((UIImage(named: "unchecked")), for:UIControl.State.normal)
            flag4 = false
        }
    }
    
    @IBAction func uploadAction(_ sender: Any) {
    }
    @IBAction func signupAction(_ sender: Any) {
    }
    
    var flag1 = false
    var flag2 = false
    var flag3 = false
    var flag4 = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        signupbtn.layer.cornerRadius = 20
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
