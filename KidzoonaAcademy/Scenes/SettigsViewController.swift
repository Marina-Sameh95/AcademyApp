//
//  SettigsViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseAuth

class SettigsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func goToProfile(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AcademyProfile", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "AcademyProfile") as! AcademyProfileViewController
        self.present(nextViewController, animated:true, completion:nil)
        
    }
    @IBAction func SignOut(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
            print("signedout")
            performSegue(withIdentifier: "toSignIn", sender:nil)
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
}
