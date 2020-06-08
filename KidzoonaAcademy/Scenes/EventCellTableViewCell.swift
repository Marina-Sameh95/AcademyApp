//
//  EventCellTableViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class EventCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventRegister: UILabel!
    
    var eventImgCell : EventModel? {
        didSet{
            eventName.text = eventImgCell?.name
            eventRegister.text = eventImgCell?.price
            eventDate.text = (eventImgCell?.date)! + "    " + (eventImgCell?.time)! as? String ?? ""
            
            let url = URL(string: (eventImgCell?.image)!)
            if let url = url as? URL{
                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                    self.eventImg.image = image
                    self.eventImg.kf.indicatorType = .activity
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
