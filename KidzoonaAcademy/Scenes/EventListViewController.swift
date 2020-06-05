//
//  EventListViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EventListViewController: UIViewController {
    

    @IBOutlet weak var tableView: UITableView!
    
    var name: NSArray = []
    var imageArray: NSArray = []
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        tableView.delegate = self
        tableView.dataSource = self
            
          
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        
    }

}

extension EventListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EventCellTableViewCell
        cell.contentView.backgroundColor = UIColor (white: 0.95, alpha: 1)
        cell.eventImg.image = imageArray[indexPath.row] as! UIImage
        cell.eventName.text! = name[indexPath.row] as! String
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Event", bundle: nil)
        let eventProfile = storyboard.instantiateViewController(withIdentifier: "EventProfile") as! EventProfileViewController
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 144
    }

}
