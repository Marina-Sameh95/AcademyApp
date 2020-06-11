//
//  EditCourse.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/29/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Kingfisher
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class EditCourse: UIViewController ,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{
    
    @IBOutlet weak var discountTxt: RoundedTextField!
    @IBOutlet weak var seatsTxt: RoundedTextField!
    @IBOutlet weak var courseImg: UIImageView!
    @IBOutlet weak var courseName: RoundedTextField!
    @IBOutlet weak var courseInstructor: RoundedTextField!
    @IBOutlet weak var coursePrice: RoundedTextField!
    @IBOutlet weak var courseDate: RoundedTextField!
    @IBOutlet weak var courseTime: RoundedTextField!
    @IBOutlet weak var courseType: RoundedTextField!
    @IBOutlet weak var coursePlace: RoundedTextField!
    @IBOutlet weak var courseDescription: RoundedTextField!
    var myCourse : Course?
    let imagePicker = UIImagePickerController()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    var courseImgString  = ""
    
    
    @IBAction func changeImg(_ sender: Any) {
        presentImgPicker()
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
    
    
    @IBAction func increaseSeats(_ sender: Any)
    {
        print(seatsTxt.text as Any)
        //        if (Int(seatsTxt.text ?? "0") ?? 0 < 95)
        //        {
        let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) + 1
        print(currentSeats as Any)
        seatsTxt.text = String(currentSeats)
        print(discountTxt.text as Any )
        
        //        }
        
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        displayCourseDetails()
        imagePicker.delegate = self
        print("course name=\(myCourse?.courseName)")
        discountTxt.text = "5%"
        discountTxt.isEnabled = false
        
        self.navigationController?.isNavigationBarHidden = true


    }
    func displayCourseDetails(){
        courseImgString = myCourse?.courseImage ?? ""
        courseName.text =   myCourse!.courseName
        courseDate.text = myCourse!.courseDate
        courseTime.text = myCourse!.courseTime
        coursePlace.text = myCourse!.coursePlace
        courseDescription.text = myCourse!.courseDescription
        discountTxt.text = myCourse!.courseOffer
        coursePrice.text = myCourse!.coursePrice
        courseInstructor.text = myCourse?.courseInstructor
        courseType.text = myCourse?.courseType
        seatsTxt.text = myCourse?.courseAvailablePlace
        
        
        let url = URL(string: (myCourse!.courseImage))
        if let url = url as? URL{
            KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                self.courseImg.image = image
                self.courseImg.kf.indicatorType = .activity
            }
        }
        else{
            courseImg.image = UIImage(named: "noimage")
            
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
    
    }
    
    
    @IBAction func save(_ sender: Any) {
        let databaseRoot = Database.database().reference()
        let academiesRoot = databaseRoot.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
        let courseRoot = academyId.child("courses")
        let courseId = courseRoot.child((myCourse?.courseID)!).child("information")
        let courseToUpload = ["courseName": courseName.text!, "courseDescription": courseDescription.text!, "courseInstructor": courseInstructor.text!, "coursePlace": coursePlace.text!, "coursePrice": coursePrice.text!, "courseOffer": discountTxt.text!, "courseDate": courseDate.text!, "courseTime": courseTime.text!, "courseAvailablePlace": seatsTxt.text!, "courseImage": courseImgString, "courseType": courseType.text!]
        courseId.setValue(courseToUpload)
        performSegue(withIdentifier: "toCourseList", sender: self)
        
    }
    
    
    
}


extension EditCourse {
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
    func uploadImageToFirebase(SelectedImg: UIImage){
        var ref = StorageReference()
        let randomInt = Int.random(in: 10..<25)
        let randomImgName = randomString(length: randomInt)
        ref = FirebaseStorage.Storage.storage().reference().child("\("CourseImages")/\(randomImgName).jpeg")
        
        if let uploadData = SelectedImg.jpegData(compressionQuality: 0.2){
            let uploadTask = ref.putData(uploadData, metadata: nil) { (metadata, error) in
                guard metadata != nil else {
                    return
                }
                ref.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    self.courseImgString = downloadURL.absoluteString
                    print("URL=\(downloadURL.absoluteString)")
                    
                }}
            
        }
    }
    
    func presentImgPicker() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("choose img")
            courseImg.image = pickedImage
            courseImg.contentMode = .scaleAspectFit
            uploadImageToFirebase(SelectedImg: pickedImage)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
  
}

extension EditCourse{
    
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
    
    
    
}
