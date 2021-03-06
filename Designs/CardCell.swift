//
//  CardCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class CardCell: UIView {
    
    @IBInspectable var cornerRadius:CFloat = 0
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    
    @IBInspectable let shadowOffSetWidth: Int = 0
    @IBInspectable let shadowOffSetHeight: Int = 1
    
    @IBInspectable var shadowOcpacity: Float = 0.2
    
    override func layoutSubviews() {
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHeight)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(cornerRadius))
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = shadowOcpacity
    }
    
    
}
