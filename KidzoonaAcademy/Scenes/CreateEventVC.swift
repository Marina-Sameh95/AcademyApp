//
//  CreateEvent.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class CreateEvent: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    var eventImgString = ""
    var eventUIImg :UIImage = UIImage()
    let imagePicker = UIImagePickerController()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    @IBOutlet weak var DiscountTxt: RoundedTextField!
    @IBOutlet weak var seatTxt: RoundedTextField!
    @IBOutlet weak var eventName: RoundedTextField!
    @IBOutlet weak var coach: RoundedTextField!
    @IBOutlet weak var price: RoundedTextField!
    @IBOutlet weak var date: RoundedTextField!
    @IBOutlet weak var time: RoundedTextField!
    @IBOutlet weak var txtDescription: RoundedTextField!
    @IBOutlet weak var eventImg: UIButton!


    func createDatePicker(){
        date.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        date.inputAccessoryView = toolbar
        date.inputView = datePicker
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        date.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    
    func createTimePicker(){
        time.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneBtn], animated: true)
        
        time.inputAccessoryView = toolbar
        time.inputView = timePicker
        timePicker.datePickerMode = .time
    }
    
    @objc func doneClicked(){
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        time.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    
    
    
    @IBAction func addImg(_ sender: Any) {
        presentImgPicker()
        
        
    }
    
    
    @IBAction func createAction(_ sender: Any) {
        if eventName.text! == "" || price.text! == "" || date.text! == "" || time.text! == "" || coach.text! == "" || seatTxt.text! == "" || txtDescription.text == ""
        {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out all fields.")
        }
        else{
        
        self.uploadImageToFirebase(completion:uploadEvent, SelectedImg:eventUIImg)
        dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    //increaseDiscountDiscount
    @IBAction func increaseDiscount(_ sender: Any) {
        print(DiscountTxt.text as Any)
        if (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0 < 95)
        {
        let Currentdisc = (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0) + 5
        print(Currentdisc as Any)
        DiscountTxt.text = String(Currentdisc) + "%"
            print(DiscountTxt.text as Any )
        }
            else
        {
                DiscountTxt.text =  "100%"
                
            }
    }
    //decreaseDiscountDiscount
    @IBAction func decreaseDiscount(_ sender: Any) {
        print(DiscountTxt.text as Any)
        if (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0 > 5)
        {
        let Currentdisc = (Int(DiscountTxt.text?.dropLast() ?? "0") ?? 0) - 5
        print(Currentdisc as Any)
        DiscountTxt.text = String(Currentdisc) + "%"
        print(DiscountTxt.text as Any )
        }
        else
        {
            DiscountTxt.text =  "0%"
        }
    }
    
    //increaseSeats
    @IBAction func increaseSeats(_ sender: Any)
    {
        print(seatTxt.text as Any)
//        if (Int(seatsTxt.text ?? "0") ?? 0 < 95)
//        {
            let currentSeats = (Int(seatTxt.text ?? "0") ?? 0) + 1
            print(currentSeats as Any)
            seatTxt.text = String(currentSeats)
            print(DiscountTxt.text as Any )
            
//        }
        
    }
    
    //decreaseSeats
    @IBAction func decreaseSeats(_ sender: Any) {
        print(seatTxt.text as Any)
        if (Int(seatTxt.text ?? "0") ?? 0 > 1)
        {
            let currentSeats = (Int(seatTxt.text ?? "0") ?? 0) - 1
            print(currentSeats as Any)
            seatTxt.text = String(currentSeats)
            print(DiscountTxt.text as Any )
        }
        else
        {
            seatTxt.text =  "0"
        }
    }
    @IBAction func backBtnPressed(_ sender: Any) {
        print("pressed")
       // dismiss(animated: true, completion: nil)
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        DiscountTxt.text = "5%"
        DiscountTxt.isEnabled = false
        
        createDatePicker()
        createTimePicker()
        
        self.navigationController?.isNavigationBarHidden = true
        

    }

    //upload Event Details To DataBase
    func uploadEvent(){
        
       
       // else {
            
        let databaseRoot = Database.database().reference()
        let academiesRoot = databaseRoot.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
        let eventsRoot = academyId.child("Events")
        let eventId = eventsRoot.childByAutoId()
        let eventToUpload = ["name":eventName.text!,"date":date.text!,"time":time.text!,"coach":coach.text!,
                             "description":txtDescription.text!,"price":price.text!,"availableSeats":seatTxt.text!,
                             "discount":DiscountTxt.text!,"image":eventImgString] as [String : Any]
        eventId.setValue(eventToUpload)
   // }
    
}
    

}

extension CreateEvent{
    
    func presentImgPicker() {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            print("choose img")
            eventImg.setImage(pickedImage, for: .normal)
                eventImg.contentMode = .scaleAspectFit
                eventUIImg = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0...length-1).map{ _ in letters.randomElement()!})
    }
    
    
    func uploadImageToFirebase(completion: (() -> ())?,SelectedImg: UIImage){
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
                    self.eventImgString = downloadURL.absoluteString
                    print("URL=\(downloadURL.absoluteString)")
                    completion?()
                    
                }}
            
        }
    }
    
}
