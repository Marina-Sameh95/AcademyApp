//
//  CourseCellTableViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class CourseCellTableViewCell: UITableViewCell {

    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseRegested: UILabel!
    @IBOutlet weak var coursePrice: UILabel!
    @IBOutlet weak var courseName: UILabel!
    
    var courseModel : Course? {
        didSet{
            courseName.text = courseModel?.courseName
            coursePrice.text = courseModel?.coursePrice
            
            let url = URL(string: (courseModel?.courseImage)!)
            if let url = url as? URL{
                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                    self.courseImg.image = image
                    self.courseImg.kf.indicatorType = .activity
                }
            }
    
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
