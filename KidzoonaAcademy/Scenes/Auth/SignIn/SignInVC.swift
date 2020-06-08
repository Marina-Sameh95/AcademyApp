//
//  SignInVC.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

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
        userSignin()
    }
    
    @IBAction func forgetPassBtn(_ sender: Any) {
        
        let alert = UIAlertController(title: "Email", message: "Please Enter Your Email Address", preferredStyle: .alert)
        alert.addTextField { (tf: UITextField) in
            tf.placeholder = "Enter Your Email Address"
            tf.keyboardType = .emailAddress
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Reset Password", style: .default, handler: { (action : UIAlertAction) in
            if let email = alert.textFields?.first?.text, !email.isEmpty{
                Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
                    if let error = error{
                        print("there is error in forget password reset", error.localizedDescription)
                    }
                    else{
                        print("success to reset password and check your Email")
                    }
                })
            }
        }))
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

        
//    @IBAction func registerBtn(_ sender: Any) {
//
//
//                let signupcontroller = ViewController()
//                self.navigationController?.pushViewController(signupcontroller, animated: true)
//    }
    
 
    
   
    
    func userSignin(){
        
        guard
            let email = emailTxt.text, email != "",
            
            let password = passwordTxt.text, password != ""
            
            else{
                AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
                
                return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if(user != nil)
            {
                let storyboard = UIStoryboard(name: "Home", bundle: nil)
                self.performSegue(withIdentifier: "toHome", sender:nil)
                
            }
            if(error != nil){
                
                AlertController.showAlert(inViewController: self, title: "Error",
                                          message: error!.localizedDescription)
            }
        }
    }

}
