//
//  FirstCollectionViewCell.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var CatagoryLBLHome: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 33
        self.layer.masksToBounds = false
    }
}
