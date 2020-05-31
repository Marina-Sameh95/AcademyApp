//
//  ViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/22/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var academyName: UITextField!
    @IBOutlet weak var academyEmail: UITextField!
    @IBOutlet weak var academyPhone1: UITextField!
    @IBOutlet weak var academyphone2: UITextField!
    
    
    @IBOutlet weak var Nextbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      

        // Do any additional setup after loading the view, typically from a nib.
        
        Nextbtn.layer.cornerRadius = 20
    }


}

