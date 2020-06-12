//
//  BlogOneViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/12/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class BlogOneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        
    }

}
