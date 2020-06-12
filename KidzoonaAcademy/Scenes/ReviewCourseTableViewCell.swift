//
//  ReviewCourseTableViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/12/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Cosmos

class ReviewCourseTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var reviewDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
