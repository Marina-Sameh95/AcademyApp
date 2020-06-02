//
//  EventCellTableViewCell.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EventCellTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventRegister: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
