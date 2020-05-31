//
//  SignInVC.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTxt: UITextField!
    
    @IBOutlet weak var passwordTxt: UITextField!
    
    @IBOutlet weak var signInBtnOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    fileprivate func setupView(){
        emailTxt.layer.cornerRadius = 15
        emailTxt.layer.borderWidth = 1
        emailTxt.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTxt.layer.cornerRadius = 15
        passwordTxt.layer.borderWidth = 1
        passwordTxt.layer.borderColor = UIColor.lightGray.cgColor
        
        signInBtnOutlet.layer.cornerRadius = 15
        
        
    }
    
    @IBAction func signInBtn(_ sender: Any) {
        
    }
    
    @IBAction func forgetPassBtn(_ sender: Any) {
        
        
    }
    
    @IBAction func registerBtn(_ sender: Any){
        
    }

}
