//
//  EventCollectionViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class EventCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    
    var eventCell : EventModel? {
        didSet{
           
            
            let url = URL(string: (eventCell?.image)!)
            if let url = url as? URL{
                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                    self.eventImage.image = image
                    self.eventImage.kf.indicatorType = .activity
                }
            }
            
        }
    }
    
}
