//
//  EventModel.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 6/7/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import Foundation


class EventModel {
    
    var name: String
    var date: String
    var time: String
    var price: String
    var descrption: String
    var image: String
    var coach: String
    var discount: String
    var availableSeats: String
    
    init(name: String, date: String, time: String, price: String, descrption: String, image: String, coach: String,
         discount: String, availableSeats: String)
    {
        self.name = name
        self.date = date
        self.time = time
        self.price = price
        self.descrption = descrption
        self.image = image
        self.coach = coach
        self.discount = discount
        self.availableSeats = availableSeats
    }
    
    init()
    {
        self.name = ""
        self.date = ""
        self.time = ""
        self.price = ""
        self.descrption = ""
        self.image = ""
        self.coach = ""
        self.discount = ""
        self.availableSeats = ""
    }
}
