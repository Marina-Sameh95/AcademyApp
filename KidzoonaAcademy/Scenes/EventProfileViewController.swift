//
//  EventProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EventProfileViewController: UIViewController  {
    



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
        pricetxt.text = eventObj?.price
        timeTxt.text = eventObj?.time
        nameTxt.text  = eventObj?.name
        seatsTxt.text = "Available places:  \(eventObj?.availableSeats ?? "")"
        datetxt.text = eventObj?.date
//        locationTxt.text = eventObj?.l
        
//        locationTxt.text = eventObj.
        
        
//        let url = URL(string: (eventObj?.image)!)
//        if let url = url as? URL{
//            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
//                self.eventImage.image = image
//                self.eventImage.kf.indicatorType = .activity
//            }
//        }
       
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: false, completion: nil)
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

extension EventProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! EventCollectionViewCell
//        if let vc = cell.viewWithTag(111) as? UIImageView {
//            vc.image = imageArr[indexPath.row]
//        } else if let ab = cell.viewWithTag(222) as? UIPageControl{
//            ab.currentPage = indexPath.row
//        }
     //   cell.eventCell = eventObj?[indexPath.row]
        
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizwForItemAt indexPath: IndexPath)-> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int)-> CGFloat {
        return 0.0
    }
    
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int)-> CGFloat{
        return 0.0
    }
}
