//
//  SecondCollectionViewCell.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgOfSecondColl: UIImageView!
    
    @IBOutlet weak var courseNameOfOffersColl: UILabel!
    
    @IBOutlet weak var discountLBLofOffersColl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imgOfSecondColl.layer.cornerRadius = 35
    }
}
