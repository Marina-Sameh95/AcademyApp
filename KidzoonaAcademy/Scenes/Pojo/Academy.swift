//
//  Academy.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//
import Foundation


class Academy : Codable {
            var name: String
            var email : String
            var phone: String
            var location: String
            var papersURL : String
            var img: String
            var password : String
            var aID :String
            var URL : String
    
    
    init(name:String,phone:String,location:String,img:String,papers:String,URL:String,email:String,password:String) {
        self.name = name
        self.phone = phone
        self.location = location
        self.papersURL = papers
        self.img = img
        self.email = email
        self.password = password
        self.aID = ""
        self.URL = URL
        
    }
    
    init() {
        self.name = ""
        self.phone = ""
        self.location = ""
        self.papersURL = ""
        self.img = ""
        self.email = ""
        self.password = ""
        self.aID = ""
        self.URL = ""
    }
    
    func encode() {
        
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            let data = try encoder.encode(self)
            UserDefaults.standard.set(data, forKey: "academy")
            
        } catch {
            print("Unable to Encode Note (\(error))")
        }
        
    }
    
    
    static func decodeAcademy ()-> Academy {
        print("in decode")
    if let data = UserDefaults.standard.data(forKey: "academy") {
        do {
            // Create JSON Decoder
            print("DECODING")
            let decoder = JSONDecoder()
            let academy = try decoder.decode(Academy.self, from: data)
            return academy
            
        } catch {
            print("Unable to Decode Academy (\(error))")
        }
        }
    else{
        print("not found")
       
        }
         return Academy()
    }
    
}
    






