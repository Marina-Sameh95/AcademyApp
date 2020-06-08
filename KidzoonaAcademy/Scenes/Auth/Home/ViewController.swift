//
//  ViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/22/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseStorage

class ViewController: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    
    @IBOutlet weak var paperImg: UIButton!
    @IBOutlet weak var uploadFileBtn: UIButton!
    @IBOutlet weak var academyImgBtn: UIButton!
    @IBOutlet weak var academyName: UITextField!
    @IBOutlet weak var academyPhone: UITextField!
    @IBOutlet weak var academyLocation: UITextField!
    var academyUIImg :UIImage = UIImage()
    var academyUIPaper :UIImage = UIImage()
    var flag : String = ""
    var academyImgString = ""
    var fileString = ""
    let imagePicker = UIImagePickerController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
//        let httpsReference = FirebaseStorage.Storage.storage().reference(forURL: "https://firebasestorage.googleapis.com/v0/b/kidzoona-57017.appspot.com/o/image%2FnnncYHXMZBLait8xQ.jpeg?alt=media&token=c7ddad80-1d76-4865-9e1f-c691e8d3eae5")
////        academyImgBtn.contentMode = .scaleAspectFit
//        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
//            if let error = error {
//            } else {
//            self.academyImgBtn.setImage(UIImage(data: data!), for: .normal)
//            }
//        }

//        let academy = Academy(name: "marwa", phone: "123", location: "roshdy", img: "", papers: "")
//        academy.encode()
//        let ac1 = Academy.decodeAcademy()
//        print(ac1.name)
   
    }
    
    @IBAction func uploadFile(_ sender: Any) {
        flag = "paper"
        presentImgPicker()
    }
    
    @IBAction func uploadImg(_ sender: Any) {
        flag = "image"
        presentImgPicker()

    }
    @IBAction func paperImg(_ sender: Any) {
        //uploading = "Images"
        flag = "paper"
        presentImgPicker()
    }
    
    @IBAction func NextBtnPressed(_ sender: Any) {
        if (academyName.hasText && academyPhone.hasText && academyLocation.hasText && academyImgString != "" && fileString != "")
        {
//            let verifyNav = {
                let academy = Academy(name: self.self.academyName.text!, phone: self.self.academyPhone.text!, location: self.self.academyLocation.text!, img: self.self.academyImgString, papers: self.self.fileString)
//                academy.papersURL = self.self.fileString
//                academy.img = self.self.academyImgString
                academy.encode()
                self.performSegue(withIdentifier: "Next", sender: nil)
                
//            }

//            let uploadFile = {
//            self.uploadImageToFirebase(completion: verifyNav, SelectedImg: self.academyUIPaper)
//                    print("file string=\(self.fileString)")
//            }
//        self.uploadImageToFirebase(completion:uploadFile, SelectedImg:academyUIImg)
//            print("Acdemy img=\(academyImgString)")
         
//            self.academyImgString = self.uploadImageToFirebase(SelectedImg: self.academyUIImg)
//            self.fileString = self.uploadImageToFirebase(SelectedImg: self.academyUIPaper)
          
//            if (fileString != "" && academyImgString != ""){
           
//            }
    }
        else {
        
                    AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
        }
    }

    func presentImgPicker() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            if (flag == "image"){
            print("choose an image")
                print("picked image size = \(pickedImage.size)")
            academyImgBtn.setImage(pickedImage, for: .normal)
            academyImgBtn.contentMode = .scaleAspectFit
//            academyUIImg = pickedImage
            uploadImageToFirebase(SelectedImg: pickedImage)

            }
            else if (flag == "paper")  {
                print("choose a file")
                paperImg.setImage(pickedImage, for: .normal)
                paperImg.contentMode = .scaleAspectFit
                academyUIPaper = pickedImage
                uploadImageToFirebase(SelectedImg: pickedImage)
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
    func uploadImageToFirebase(SelectedImg: UIImage){
        print("selected image size = \(SelectedImg.size)")
        var ref = StorageReference()
        let randomInt = Int.random(in: 10..<25)
        let randomImgName = randomString(length: randomInt)
        if (flag == "image") {
        ref = FirebaseStorage.Storage.storage().reference().child("\("Images")/\(randomImgName).jpeg")
        }
        else {
             ref = FirebaseStorage.Storage.storage().reference().child("\("Papers")/\(randomImgName).jpeg")
        }
        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
            let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
                guard let metadata = metadata else {
                    print(error?.localizedDescription)
                    print("in else")
                    return
                }
                print("after else")
                ref.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        print(error?.localizedDescription)
                        return
                    }
                    if (self.flag == "image"){
                        print("IMMMMG= \(downloadURL.absoluteString)")
                        self.academyImgString = downloadURL.absoluteString
                    }
                    else {
                        self.fileString = downloadURL.absoluteString
                    }
                    print("URL=\(downloadURL.absoluteString)")
                }
            
        }
            
        }
    }
//    func uploadImageToFirebase(SelectedImg: UIImage){
//        var ref = StorageReference()
//        let randomInt = Int.random(in: 10..<25)
//        let randomImgName = randomString(length: randomInt)
////        if SelectedImg.pngData() == academyUIPaper.pngData() {
//        if (flag == "paper"){
//            ref = FirebaseStorage.Storage.storage().reference().child("\("Papers")/\(randomImgName).jpeg")
//            
//        }
//        else if (flag == "image") {
//            ref = FirebaseStorage.Storage.storage().reference().child("\("Images")/\(randomImgName).jpeg")
//        }
//        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
//        let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
//                guard metadata != nil else {
//                    return
//                }
//                ref.downloadURL { (url, error) in
//                    guard let downloadURL = url else {
//                        return
//                    }
////                    if SelectedImg.pngData() == self.academyUIPaper.pngData() {
//                    if (self.flag == "image"){
//                        print("IMMMMG= \(downloadURL.absoluteString)")
//                        self.academyImgString = downloadURL.absoluteString
//                    }
////                    else if SelectedImg.pngData() == self.academyUIImg.pngData() {
//                    else if (self.flag == "paper"){
//                        self.fileString = downloadURL.absoluteString
//                    }
//
//                    print("URL=\(downloadURL.absoluteString)")
//
//                }}
//                        uploadTask.observe(.progress) { (snapshot) in
//                            if let completeUnitCount = snapshot.progress?.completedUnitCount{
//                                print(completeUnitCount)
//                                self.parent?.navigationItem.title = String(completeUnitCount)
//                            }}
//                        uploadTask.observe(.success) { (snapshot) in
//                            self.parent?.navigationItem.title = ""
//
//                        }
//        }
//        
//        
//    }
//    
    
//    func upload(data: Data,
//                withName fileName: String,
//                atPath path:StorageReference,
//                block: @escaping (_ url: String?) -> Void) {
//
//        // Upload the file to the path
//        self.currentUploadTask = path.putData(data, metadata: nil) { (metaData, error) in
//            guard metaData != nil else {
//
//                // Uh-oh, an error occurred!
//                block(nil)
//                return
//            }
//            // Metadata contains file metadata such as size, content-type.
//            // let size = metadata.size
//            // You can also access to download URL after upload.
//            path.downloadURL { (url, error) in
//                guard let downloadURL = url else {
//                    // Uh-oh, an error occurred!
//                    block(nil)
//                    return
//                }
//                block(downloadURL.absoluteString)
//            }
//        }
//    }
//
//    func cancel() {
//        self.currentUploadTask?.cancel()
//    }
//}

    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }


}

