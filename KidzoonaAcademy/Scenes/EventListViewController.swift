//
//  EventListViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class EventListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    var events: [EventModel] = []
    
    var name: NSArray = []
    var imageArray: NSArray = []
    
        override func viewDidLoad() {
        super.viewDidLoad()
            events = []
            getAcademyEvents()

        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
            
          
    }
    
    @IBAction func addBtnPressed(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "CreateEvent", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "CreateEvent") as! CreateEvent
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        self.navigationController?.isNavigationBarHidden = true
    }



func getAcademyEvents(){
    let aID = Auth.auth().currentUser?.uid
    let query = Database.database().reference().child("Academies").child(aID!).child("Events").queryLimited(toLast: 10)
    _ = query.observe(.value, with: { [weak self] snapshot in
        self?.events = []
        //if let eid = snapshot.key as? String{
        if let eventList = snapshot.value as? [String:Any]{
            let eventids = eventList.keys
            for id in eventids{
                let event = eventList[id] as? [String:Any]
                let name = event?["name"] as! String
                let desc = event?["description"] as! String
                let price = event?["price"] as! String
                let date = event?["date"] as! String
                let time = event?["time"] as! String
                let seats = event?["availableSeats"] as! String
                let coach = event?["coach"] as! String
                let img = event?["image"] as! String
                let discount = event?["discount"] as! String
                let eventModel = EventModel(name: name , date: date, time: time, price: price, descrption: desc, image: img, coach: coach, discount: discount, availableSeats: seats)
                print(eventModel.price)
                self?.events.append(eventModel)
                self?.tableView.reloadData()
                print(name)
                
                //                        let date = eventDict[id]
                
                
//                print(id  as? String)
//                print(eventList[id])
//                let event = eventList[id] as? [String:Any]
//                print(event?["location"])
                
                
            }
            print(self?.events)
            
            //                    print("id=\(eid)")
            //                    print("price=\(price)")
            //                    let image1 = images["image1"]
            //                    let image2 = images["image2"]
            //                    print("price=\(price)")
            //                    print("images: \(image1)")
            //                    print("image2 =\(image2)")
            
            
            // }
            
        }
    })
}

}
extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EventCellTableViewCell
        cell.contentView.backgroundColor = UIColor (white: 0.95, alpha: 1)
        cell.eventImgCell = events[indexPath.row]

        
//         cell.eventName.text! = events[indexPath.row].name as? String ?? ""
//        cell.eventRegister.text! = events[indexPath.row].price as? String ?? ""
//        cell.eventDate.text! = events[indexPath.row].date + "    " + events[indexPath.row].time as? String ?? ""
//        if ( self.events[indexPath.row].image != ""){
//            let httpsReference = FirebaseStorage.Storage.storage().reference(forURL:self.events[indexPath.row].image)
//        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//                // Uh-oh, an error occurred!
//            } else {
//                // Data for "images/island.jpg" is returned
//                cell.eventImg.image = UIImage(data: data!)
//                }
//            }
        
        //}
//        else {
//            cell.eventImg.image = UIImage(named: "noimage")
//        }
    
        
       
        // Do any additional setup after loading the view, typically from a nib.
    
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        var selectedEvent = events[indexPath.row]
        performSegue(withIdentifier: "toSingleEvent", sender:selectedEvent)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSingleEvent"){
            let singleEventVC = segue.destination as! EventProfileViewController
            singleEventVC.eventObj = sender as! EventModel
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 144
    }
  
    @IBAction func unwind(for unwindSegue:UIStoryboardUnwindSegueSource, towards subsequentVC: UIViewController) {
        
    }
    
}
