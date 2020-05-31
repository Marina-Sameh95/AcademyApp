//
//  CreateEvent.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CreateEvent: UIViewController {
    @IBOutlet weak var DiscountTxt: RoundedTextField!
    
    @IBOutlet weak var seatsTxt: RoundedTextField!
    
    @IBAction func increaseDiscount(_ sender: Any) {
        print(DiscountTxt.text as Any)
        if (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0 < 95)
        {
        let Currentdisc = (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0) + 5
        print(Currentdisc as Any)
        DiscountTxt.text = String(Currentdisc) + "%"
            print(DiscountTxt.text as Any )
            
        }
            else
        {
                DiscountTxt.text =  "100%"
                
            }
        
    }
    @IBAction func decreaseDiscount(_ sender: Any) {
        print(DiscountTxt.text as Any)
        if (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0 > 5)
        {
        let Currentdisc = (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0) - 5
        print(Currentdisc as Any)
        DiscountTxt.text = String(Currentdisc) + "%"
        print(DiscountTxt.text as Any )
        }
        else
        {
            DiscountTxt.text =  "0%"

            
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
            print(DiscountTxt.text as Any )
            
//        }
        
    }
    
    
    @IBAction func decreaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        if (Int(seatsTxt.text ?? "0") ?? 0 > 1)
        {
            let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) - 1
            print(currentSeats as Any)
            seatsTxt.text = String(currentSeats)
            print(DiscountTxt.text as Any )
        }
        else
        {
            seatsTxt.text =  "0"
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        DiscountTxt.text = "5%"
        DiscountTxt.isEnabled = false

        // Do any additional setup after loading the view.
    }
    
    
    func setView(){

        
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
