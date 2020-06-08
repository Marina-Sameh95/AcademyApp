//
//  CreateCourseViewController.swift
//  KidzoonaAcademy
//
//  Created by Marina Sameh on 5/30/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseStorage

class CreateCourseViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var seatsTxt: RoundedTextField!
    @IBOutlet weak var discountTxt: RoundedTextField!
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseName: RoundedTextField!
    @IBOutlet weak var courseInstructor: RoundedTextField!
    @IBOutlet weak var courseDescription: RoundedTextField!
    @IBOutlet weak var courseDate: RoundedTextField!
    @IBOutlet weak var courseTime: RoundedTextField!
    @IBOutlet weak var courseType: RoundedTextField!
    @IBOutlet weak var coursePlace: RoundedTextField!
    @IBOutlet weak var coursePrice: RoundedTextField!
    
    @IBAction func backBtn(_ sender: Any) {
        print("pressed")
       // dismiss(animated: true, completion: nil)
       self.presentingViewController?.dismiss(animated: true, completion: nil)
//        let courseList = UIStoryboard(name: "Course", bundle: nil).instantiateViewController(withIdentifier: "CourseList")
//
//        self.navigationController?.pushViewController(courseList, animated: true)
        
    }
    
    var courseArr = [Course]()
    
    var ref: DatabaseReference?
    let imagePicker = UIImagePickerController()
    var urlImg: String = ""
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    
    
    @IBAction func imgPicker(_ sender: Any) {
        print("btn pressed")
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            courseImg.contentMode = .scaleAspectFit
            courseImg.image = pickedImage
            self.UploadImageToFirebase(SelectedImg: pickedImage)
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
    func UploadImageToFirebase(SelectedImg: UIImage){
        print("Image selected")
        let randomInt = Int.random(in: 0..<25)
        let randomImgName = randomString(length: randomInt)
        let ref = FirebaseStorage.Storage.storage().reference().child("CourseImages/\(randomImgName).jpeg")
        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
            print("uploadData=\(uploadData)")
            
            //            let mountainImagesRef = ref.child("marwa.jpg")
            let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
                guard metadata != nil else {
                    // Uh-oh, an error occurred!
                    return
                }
                
                ref.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        // Uh-oh, an error occurred!
                        return
                    }
                    print("URL=\(downloadURL.absoluteString)")
                    self.urlImg = downloadURL.absoluteString
                    
                }
                
            }
            
            
        }
        
    }
    
    
    @IBAction func createCourse(_ sender: Any) {
        
        let academiesRoot = ref!.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
          let courseRoot =  academyId.child("courses")
          let courseId = courseRoot.childByAutoId()
        
//        var academyId = ref?.child("Academies").child("NZaf6cB3j5eNeBQoQPcB0wbESZ12")
//        var courseId =  academyId!.child("courses").childByAutoId()
        
        let courseData = ["courseName": courseName.text!, "courseDescription": courseDescription.text!, "courseInstructor": courseInstructor.text!, "coursePlace": coursePlace.text!, "coursePrice": coursePrice.text!, "courseOffer": discountTxt.text!, "courseDate": courseDate.text!, "courseTime": courseTime.text!, "courseAvailablePlace": seatsTxt.text!, "courseImage": urlImg, "courseType": courseType.text!]
        
         courseId.child("information").setValue(courseData)
       courseId.child("review").setValue(["userName":"mark", "rate": "8.5", "date":"30/6/2020"])
        
        
    }
    
    
    
    
    
    
    @IBAction func increaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        
        let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) + 1
        print(currentSeats as Any)
        seatsTxt.text = String(currentSeats)
        print(discountTxt.text as Any )
        
    }
    
    
    @IBAction func decreaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        if (Int(seatsTxt.text ?? "0") ?? 0 > 1)
        {
            let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) - 1
            print(currentSeats as Any)
            seatsTxt.text = String(currentSeats)
            print(discountTxt.text as Any )
        }
        else
        {
            seatsTxt.text =  "0"
            
            
        }
    }
    
    
    @IBAction func increaseDiscount(_ sender: Any) {
        print(discountTxt.text as Any)
        if (Int(discountTxt.text?.dropLast() ?? "0") ?? 0 < 95)
        {
            let Currentdisc = (Int(discountTxt.text?.dropLast() ?? "0") ?? 0) + 5
            print(Currentdisc as Any)
            discountTxt.text = String(Currentdisc) + "%"
            print(discountTxt.text as Any )
            
        }
        else
        {
            discountTxt.text =  "100%"
            
        }
        
    }
    
    
    @IBAction func decreaseDiscount(_ sender: Any) {
        print(discountTxt.text as Any)
        if (Int(discountTxt.text?.dropLast() ?? "0") ?? 0 > 5)
        {
            let Currentdisc = (Int(discountTxt.text?.dropLast() ?? "0") ?? 0) - 5
            print(Currentdisc as Any)
            discountTxt.text = String(Currentdisc) + "%"
            print(discountTxt.text as Any )
        }
        else
        {
            discountTxt.text =  "0%"
            
            
        }
    }
    
    func createDatePicker(){
        courseDate.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        courseDate.inputAccessoryView = toolbar
        courseDate.inputView = datePicker
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        courseDate.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    func createTimePicker(){
        courseTime.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneBtn], animated: true)
        
        courseTime.inputAccessoryView = toolbar
        courseTime.inputView = timePicker
        timePicker.datePickerMode = .time
    }
    
    @objc func doneClicked(){
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        courseTime.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        discountTxt.text = "5%"
        discountTxt.isEnabled = false
     
        self.navigationController?.isNavigationBarHidden = true
        
        ref = Database.database().reference()
        
        createDatePicker()
        createTimePicker()
        
        imagePicker.delegate = self
        let httpsReference = FirebaseStorage.Storage.storage().reference(forURL: "gs://kidzoona-57017.appspot.com/")
        courseImg.contentMode = .scaleAspectFit
        httpsReference.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                self.courseImg.image = UIImage(data: data!)
                
            }
            
            
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
    
    }

}
