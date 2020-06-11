//
//  EventProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher

class EventProfileViewController: UIViewController  {
    


    @IBOutlet weak var eventImg: UIImageView!
    @IBOutlet weak var locationTxt: UILabel!
    @IBOutlet weak var datetxt: UILabel!
    @IBOutlet weak var nameTxt: UILabel!
    @IBOutlet weak var timeTxt: UILabel!
    @IBOutlet weak var pricetxt: UILabel!
    @IBOutlet weak var seatsTxt: UILabel!
    @IBOutlet weak var descTxt: UITextView!
    
  
    
    var eventObj : EventModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        displayEvent()
        print("event obj name =" + eventObj!.name ?? "" )

        // Do any additional setup after loading the view.
        
    }
    
    func displayEvent(){
        descTxt.text = eventObj?.descrption
        pricetxt.text = eventObj?.price ?? "" + " LE"
        timeTxt.text = eventObj?.time
        nameTxt.text  = eventObj?.name
        seatsTxt.text = "Available places:  \(eventObj?.availableSeats ?? "")"
        datetxt.text = eventObj?.date
        locationTxt.text = eventObj?.location
        let url = URL(string: (eventObj?.image)!)
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.eventImg.image = image
                self.eventImg.kf.indicatorType = .activity
            }
        }
       
    }
    
    @IBAction func toEventProfile(_ unwindSegue: UIStoryboardSegue){}
    
    @IBAction func editPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "EditEvent", bundle: nil)
        performSegue(withIdentifier: "toEdit", sender:eventObj)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toEdit"){
            let editEventVC = segue.destination as! EditEvent
            editEventVC.eventObj = sender as? EventModel
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}

    
   

