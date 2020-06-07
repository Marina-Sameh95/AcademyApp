//
//  CourseModel.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 6/7/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import Foundation
class Course {
    
    var courseName :String!
    var courseType :String!
    var courseDate :String!
    var courseDescription :String!
    var courseImage :String!
    var courseInstructor :String!
    var courseOffer :String!
    var coursePlace :String!
    var coursePrice :String!
    var courseTime :String!
    var courseAvailablePlace :String!
    
    init(courseName:String ,courseType:String ,courseDate:String ,courseDescription:String ,courseImage:String ,courseInstructor:String ,courseOffer:String ,coursePlace:String ,coursePrice:String ,courseTime:String ,courseAvailablePlace:String) {
        
        
        self.courseName = courseName
        self.courseType = courseType
        self.courseDate = courseDate
        self.courseDescription = courseDescription
        self.courseImage = courseImage
        self.courseInstructor = courseInstructor
        self.courseOffer = courseOffer
        self.coursePlace = coursePlace
        self.coursePrice = coursePrice
        self.courseTime = courseTime
        self.courseAvailablePlace = courseAvailablePlace
        
    }
    
}
