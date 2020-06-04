//
//  CreateCourseViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CreateCourseViewController: UIViewController {
    
    
    @IBOutlet weak var seatsTxt: RoundedTextField!
    
    @IBOutlet weak var discountTxt: RoundedTextField!
    
    @IBAction func increaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        
        let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) + 1
        print(currentSeats as Any)
        seatsTxt.text = String(currentSeats)
        print(discountTxt.text as Any )
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discountTxt.text = "5%"
        discountTxt.isEnabled = false
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