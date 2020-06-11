
//
//  EditAcademy.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseStorage
import Kingfisher
import FirebaseDatabase
import FirebaseAuth

class EditAcademy: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
   
    
    @IBOutlet weak var academyImg: UIButton!
    @IBOutlet weak var academtNameTxt: UITextField!
    @IBOutlet weak var academyPhoneTxt: UITextField!
    @IBOutlet weak var academyLocationTxt: UITextField!
    @IBOutlet weak var academyURLTxt: UITextField!
    let imagePicker = UIImagePickerController()
    var academyImgString = ""
    var academy : Academy?


    override func viewDidLoad() {
        super.viewDidLoad()
        displayAcademyDetails()
        imagePicker.delegate = self
        print("Academy edit = \(academy?.name)")
//        AvatarImg = UIImageView(frame: CGRect(x: 0, y: 0, width: 86, height: 86))

        // Do any additional setup after loading the view.
    }
    
    func displayAcademyDetails() {
        academyImgString = academy?.img ?? ""
        let url = URL(string: (academy?.img ?? ""))
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.academyImg.setImage(image, for: .normal)
            }
        }
        else{
            academyImg.setImage(UIImage(named: "noimage"), for: .normal)
        }
            academtNameTxt.text = academy?.name
            academyPhoneTxt.text = academy!.phone
    academyLocationTxt.text = academy!.location
        if (academy!.URL == ""){
    academyURLTxt.placeholder = "Academy URL"

    }
    else {
            print("in URL")
                academyURLTxt.text = academy?.URL
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
                uploadImageToFirebase(SelectedImg: pickedImage)
            }
            
        

        dismiss(animated: true, completion: nil)
}
    
    @IBAction func savePressed(_ sender: Any) {
        let databaseRoot = Database.database().reference()
        let academiesRoot = databaseRoot.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
        let info = academyId.child("Information")
        let academyToUpload = ["name":academtNameTxt.text,"phone":academyPhoneTxt!.text,"location":academyLocationTxt!.text,"image":academyImgString,"papers":academy!.papersURL,"email":academy!.email,"password":academy!.password,"URL":academyURLTxt.text] as [String : Any]
        info.setValue(academyToUpload)
        academy!.name = academtNameTxt.text!
        academy!.phone = academyPhoneTxt.text!
        academy!.location = academyLocationTxt.text!
        academy?.img = academyImgString
        performSegue(withIdentifier: "toAcademyProfile", sender: self)
        
        
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



extension EditAcademy {
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
    func uploadImageToFirebase(SelectedImg: UIImage){
        var ref = StorageReference()
        let randomInt = Int.random(in: 10..<25)
        let randomImgName = randomString(length: randomInt)
        ref = FirebaseStorage.Storage.storage().reference().child("\("EventImages")/\(randomImgName).jpeg")
        
        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
            let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
                guard metadata != nil else {
                    return
                }
                ref.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    self.academyImgString = downloadURL.absoluteString
                    print("URL=\(downloadURL.absoluteString)")
                    
                }}
            
        }
    }
}
