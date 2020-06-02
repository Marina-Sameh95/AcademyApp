//
//  FinalSignupViewController.swift
//  KidzoonaAcademy
//
//  Created by Marwan Magdy on 5/28/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class FinalSignupViewController: UIViewController {

    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtConfpass: UITextField!
    
    @IBOutlet weak var signup: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    @IBAction func Signup(_ sender: Any) {
        
        setupNewUser()
    }
    
    
    @IBAction func Backbtn(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    
    fileprivate func setupView(){
        txtEmail.layer.cornerRadius = 15
        txtEmail.layer.borderWidth = 1
        txtEmail.layer.borderColor = UIColor.lightGray.cgColor
        
        txtPass.layer.cornerRadius = 15
        txtPass.layer.borderWidth = 1
        txtPass.layer.borderColor = UIColor.lightGray.cgColor
        
        txtConfpass.layer.cornerRadius = 15
        txtConfpass.layer.borderWidth = 1
        txtConfpass.layer.borderColor = UIColor.lightGray.cgColor
        
        signup.layer.cornerRadius = 15
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setupNewUser() {
        
        guard
            let email = txtEmail.text, email != "",
            
            let password = txtPass.text, password != ""
            
            else{
                AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
                
                return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if(user != nil)
            {
                let waitcontroller = WaitViewController()
                self.navigationController?.pushViewController(waitcontroller, animated: true)
            }
            if(error != nil)
            {
                AlertController.showAlert(inViewController: self, title: "Error", message: error!.localizedDescription)
            }
        }
    }

}
