//
//  HomeVC.swift
//  KidzoonaAcademy
//
//  Created by MacOSSierra on 5/31/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    
    
    @IBOutlet weak var thirdCollectionView: UICollectionView!
    
    let arrayTest = ["Offers", "Events", "Music", "Robotics", "Swimming", "Chess"]
    
    var arrayOfNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    var arrayOfEventsNames = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        thirdCollectionView.delegate = self
        thirdCollectionView.dataSource = self
        
         navigationController?.navigationBar.barTintColor = UIColor(red: 149/255 , green: 135/255 , blue: 202/255 , alpha: 1)
    }
    

}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return arrayTest.count
        }else if collectionView == secondCollectionView {
            return arrayOfNames.count
        }else{
            return arrayOfEventsNames.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == firstCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstCell", for: indexPath) as? FirstCollectionViewCell
            
            cell?.CatagoryLBLHome.text = arrayTest[indexPath.row]
            
            return cell!
            
        }else if collectionView == secondCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondCell", for: indexPath) as? SecondCollectionViewCell
            // IMAGE ... come from count of courses in courses list -> image child offer in it
            cell?.courseNameOfOffersColl.text = arrayOfNames[indexPath.row]
            // DISCOUNT ... come from count of courses in courses list -> discount child offer in it
            
            return cell!
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "thirdCell", for: indexPath) as? ThirdCollectionViewCell
            // IMAGE & eventName ... come from count of Events in events list -> image child offer in it
            cell?.EventNameOfEventsColl.text = arrayOfEventsNames[indexPath.row]
            return cell!
        }
        
    }

    
    
}
