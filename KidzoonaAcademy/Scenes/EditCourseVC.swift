//
//  EditCourse.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/29/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EditCourse: UIViewController {
    
    @IBOutlet weak var discountTxt: RoundedTextField!
    @IBOutlet weak var seatsTxt: RoundedTextField!
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseName: RoundedTextField!
    @IBOutlet weak var courseInstructor: RoundedTextField!
    @IBOutlet weak var coursePrice: RoundedTextField!
    @IBOutlet weak var courseDate: RoundedTextField!
    @IBOutlet weak var courseTime: RoundedTextField!
    @IBOutlet weak var courseType: RoundedTextField!
    @IBOutlet weak var coursePlace: RoundedTextField!
    @IBOutlet weak var courseDescription: RoundedTextField!
    
    @IBAction func backBtn(_ sender: Any) {
        print("pressed")
        dismiss(animated: true, completion: nil)
        //   self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func imagePicker(_ sender: Any) {
        
    }
    
    
    
    @IBAction func increaseDiscount(_ sender: Any) {
        print(discountTxt.text as Any)
        if (Int(discountTxt.text?.dropLast() ?? "0") ?? 0 < 95)
        {
            let Currentdisc = (Int(discountTxt.text?.dropLast() ?? "0") ?? 0) + 5
            print(Currentdisc as Any)
            discountTxt.text = String(Currentdisc) + "%"
            print(discountTxt.text as Any )
            
        }
        else
        {
            discountTxt.text =  "100%"
            
        }
        
    }
    @IBAction func decreaseDiscount(_ sender: Any) {
        print(discountTxt.text as Any)
        if (Int(discountTxt.text?.dropLast() ?? "0") ?? 0 > 5)
        {
            let Currentdisc = (Int(discountTxt.text?.dropLast() ?? "0") ?? 0) - 5
            print(Currentdisc as Any)
            discountTxt.text = String(Currentdisc) + "%"
            print(discountTxt.text as Any )
        }
        else
        {
            discountTxt.text =  "0%"
            
            
        }
    }
    
    
    @IBAction func increaseSeats(_ sender: Any)
    {
        print(seatsTxt.text as Any)
        //        if (Int(seatsTxt.text ?? "0") ?? 0 < 95)
        //        {
        let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) + 1
        print(currentSeats as Any)
        seatsTxt.text = String(currentSeats)
        print(discountTxt.text as Any )
        
        //        }
        
    }
    
    
    @IBAction func decreaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        if (Int(seatsTxt.text ?? "0") ?? 0 > 1)
        {
            let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) - 1
            print(currentSeats as Any)
            seatsTxt.text = String(currentSeats)
            print(discountTxt.text as Any )
        }
        else
        {
            seatsTxt.text =  "0"
            
            
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        discountTxt.text = "5%"
        discountTxt.isEnabled = false
        
        self.navigationController?.isNavigationBarHidden = true


    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
    
    }
    
    
    @IBAction func save(_ sender: Any) {
    }
    
    
    
}
