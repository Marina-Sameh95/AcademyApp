//
//  WaitViewController.swift
//  KidzoonaAcademy
//
//  Created by Marwan Magdy on 6/1/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.indicator.stopAnimating()
            self.performSegue(withIdentifier: "toFinalSignup", sender: nil)
        }

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
