//
//  UndeLinedTextfield.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class UndeLinedTextfield: UITextField {
    
    override func prepareForInterfaceBuilder() {
        CustomizeTextField()
    }
    
    
    override func awakeFromNib() {
        super .awakeFromNib()
        CustomizeTextField()
        
    }
    
    func CustomizeTextField() {
        //        backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.lightGray.cgColor
            CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width-10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
        
        /*
         // Only override draw() if you perform custom drawing.
         // An empty implementation adversely affects performance during animation.
         override func draw(_ rect: CGRect) {
         // Drawing code
         }
         */
    }
    
  

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
