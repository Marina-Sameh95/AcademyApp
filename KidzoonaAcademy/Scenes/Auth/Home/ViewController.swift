//
//  ViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/22/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
//import FirebaseStorage


class ViewController: UIViewController {

    
    @IBOutlet weak var uploadFileBtn: UIButton!
    @IBOutlet weak var academyImgBtn: UIButton!
    @IBOutlet weak var academyName: UITextField!
    @IBOutlet weak var academyPhone: UITextField!
    @IBOutlet weak var academyLocation: UITextField!
    var uploading : String = ""
    var academyImgString = ""
    var fileString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let academy = Academy(name: "marwa", phone: "123", location: "roshdy", img: "", papers: "")
//        academy.encode()
//        let ac1 = Academy.decodeAcademy()
//        print(ac1.name)
   
    }
    
    @IBAction func uploadFile(_ sender: Any) {
        uploading = "File"
        presentImgPicker()
    }
    
    @IBAction func uploadImg(_ sender: Any) {
        uploading = "image"
        presentImgPicker()

    }
    
    @IBAction func NextBtnPressed(_ sender: Any) {
        if (academyName.hasText && academyPhone.hasText && academyLocation.hasText )
        {
            let academy = Academy(name: academyName.text!, phone: academyPhone.text!, location: academyLocation.text!, img: academyImgString, papers: fileString)
            academy.encode()
            performSegue(withIdentifier: "Next", sender: nil)    
    }
    }
    
    func presentImgPicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if (uploading == "Image"){
                academyImgBtn.setImage(pickedImage, for: .normal)
                academyImgBtn.contentMode = .scaleAspectFit
            }
            else {}
          //  uploadImageToFirebase(SelectedImg: pickedImage)
            }
        dismiss(animated: true, completion: nil)
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
//    func uploadImageToFirebase(SelectedImg: UIImage){
//        let randomInt = Int.random(in: 0..<25)
//        let randomImgName = randomString(length: randomInt)
//        let ref = FirebaseStorage.Storage.storage().reference().child("\(uploading)/\(randomImgName).jpeg")
//        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
//        print("uploadData=\(uploadData)")
//        let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
//                guard metadata != nil else {
//                    return
//                }
//                ref.downloadURL { (url, error) in
//                    guard let downloadURL = url else {
//                        return
//                    }
//                    if (self.uploading == "Image"){
//                        self.academyImgString = downloadURL.absoluteString
//                    }
//                    else {
//                        self.fileString = downloadURL.absoluteString
//                    }
//
//                    // let ImgURL = downloadURL.absoluteString
//                    //                    self.sendMsgWithImgURL(ImageURL: ImgURL)
//                    print("URL=\(downloadURL.absoluteString)")
//
//
//                }}
            //            uploadTask.observe(.progress) { (snapshot) in
            //                if let completeUnitCount = snapshot.progress?.completedUnitCount{
            //                    print(completeUnitCount)
            //                    self.parent?.navigationItem.title = String(completeUnitCount)
            //                }}
            //            uploadTask.observe(.success) { (snapshot) in
            //                self.parent?.navigationItem.title = ""
            //
            //            }
            
      //  }}
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}

