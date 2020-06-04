
//
//  EditAcademy.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseStorage

class EditAcademy: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
   
    
    @IBOutlet weak var academyImg: UIButton!
    @IBOutlet weak var academtNameTxt: UITextField!
    @IBOutlet weak var academyPhoneTxt: UITextField!
    @IBOutlet weak var academyLocationTxt: UITextField!
    @IBOutlet weak var academyURLTxt: UITextField!
    let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        displayAcademyDetails()
        imagePicker.delegate = self
//        AvatarImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 86, height: 86))


        // Do any additional setup after loading the view.
    }
    
    func displayAcademyDetails() {
    let academy = Academy.decodeAcademy()
    let httpsReference = FirebaseStorage.Storage.storage().reference(forURL: academy.img)
    academyImg.contentMode = .scaleAspectFit
    httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
    if let error = error {
    // Uh-oh, an error occurred!
    } else {
    // Data for "images/island.jpg" is returned
    self.academyImg.setImage(UIImage(data: data!), for: .normal)
    }
    }
    academtNameTxt.text = academy.name
    academyPhoneTxt.text = academy.phone
    academyLocationTxt.text = academy.location
    if (academy.URL == ""){
    academyURLTxt.placeholder = "Academy URL"
    
    }
    else {
    academyURLTxt.text = academy.URL
    }
    }
    @IBAction func academyImgPressed(_ sender: Any) {
        presentImgPicker()

    }
    
    func presentImgPicker() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            academyImg.setImage(pickedImage, for: .normal)
            
        
            
            
                //                uploadImageToFirebase(SelectedImg: pickedImage)
            }
            
        

        dismiss(animated: true, completion: nil)
}
    
    @IBAction func savePressed(_ sender: Any) {
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
