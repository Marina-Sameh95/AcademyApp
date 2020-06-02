//
//  CourseCellTableViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class CourseCellTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseRegested: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var courseName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
