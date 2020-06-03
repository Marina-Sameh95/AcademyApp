//
//  FinalSignupViewController.swift
//  KidzoonaAcademy
//
//  Created by Marwan Magdy on 5/28/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class FinalSignupViewController: UIViewController {

    
    @IBOutlet weak var txtname: UILabel!
    @IBOutlet weak var txtemail: UILabel!
    
    @IBOutlet weak var txtpass: UITextField!
    @IBOutlet weak var txtconfpass: UITextField!
    
    @IBOutlet weak var signup: UIView!
    
    @IBAction func Signup(_ sender: Any) {
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.indicator.stopAnimating()
            self.performSegue(withIdentifier: "toFinalSignup", sender: nil)
        }

        signup.layer.cornerRadius = 20
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
