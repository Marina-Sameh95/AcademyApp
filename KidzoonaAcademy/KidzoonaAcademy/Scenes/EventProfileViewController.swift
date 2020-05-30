//
//  EventProfileViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class EventProfileViewController: UIViewController  {
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var sliderPage: UIPageControl!
    
    var imageArr = [
        UIImage(named: "event1"),
        UIImage(named: "event2"),
        UIImage(named: "event3")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
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
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        if let vc = cell.viewWithTag(111) as? UIImageView {
            vc.image = imageArr[indexPath.row]
        } else if let ab = cell.viewWithTag(222) as? UIPageControl{
            ab.currentPage = indexPath.row
        }
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
