//
//  ThirdCollectionViewCell.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class ThirdCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imgOfEventsColl: UIImageView!
    
    @IBOutlet weak var EventNameOfEventsColl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgOfEventsColl.layer.cornerRadius = 35
    }
}
