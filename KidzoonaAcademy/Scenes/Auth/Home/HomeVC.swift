//
//  HomeVC.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBAction func blog1Btn(_ sender: Any) {
        
        let blogOne = UIStoryboard(name: "Blog1", bundle: nil).instantiateViewController(withIdentifier: "BlogOne")
    
              self.navigationController?.pushViewController(blogOne, animated: true)
        
    }
    
    
    @IBAction func blog2Btn(_ sender: Any) {
        
        let blogOne = UIStoryboard(name: "BlogTwo", bundle: nil).instantiateViewController(withIdentifier: "BlogTwo")
        
        self.navigationController?.pushViewController(blogOne, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false

        
         navigationController?.navigationBar.barTintColor = UIColor(red: 149/255 , green: 135/255 , blue: 202/255 , alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = "Home"
        navigationController?.isNavigationBarHidden = false
        
    }
        

}

    

