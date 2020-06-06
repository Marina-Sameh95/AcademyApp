//
//  CreateEvent.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/27/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import Firebase

class CreateEvent: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    private var datePicker: UIDatePicker?
    var eventImgString = ""
    var eventUIImg :UIImage = UIImage()
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var DiscountTxt: RoundedTextField!
    @IBOutlet weak var seatTxt: RoundedTextField!
    @IBOutlet weak var eventName: RoundedTextField!
    @IBOutlet weak var coach: RoundedTextField!
    @IBOutlet weak var price: RoundedTextField!
    @IBOutlet weak var date: RoundedTextField!
    @IBOutlet weak var time: RoundedTextField!
    @IBOutlet weak var txtDescription: RoundedTextField!
    @IBOutlet weak var eventImg: UIButton!
    
    @IBAction func addImg(_ sender: Any) {
        
        presentImgPicker()
    }
    
    
    @IBAction func createAction(_ sender: Any) {
        
        self.uploadImageToFirebase(completion:uploadEvent, SelectedImg:eventUIImg)
        print("Event img=\(eventImgString)")
        
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self 
        
        DiscountTxt.text = "5%"
        DiscountTxt.isEnabled = false
        
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(CreateEvent.dateChanged(datePicker:)),
                              for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:
            #selector(CreateEvent.viewTapped(gestureRecognizer:)))
        
        view.addGestureRecognizer(tapGesture)
        
         date.inputView = datePicker
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer) {
        
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy"
        date.text = dateformatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    func presentImgPicker() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            
                eventImg.setImage(pickedImage, for: .normal)
                eventImg.contentMode = .scaleAspectFit
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
    
    //upload Event Details To DataBase
    func uploadEvent(){
        
        if eventName.text! == "" && price.text! == "" && date.text! == "" && time.text! == ""
        {
            AlertController.showAlert(inViewController: self, title: "Alert", message: "Please fill out requered fields.")
        }
        else {
            
        let databaseRoot = Database.database().reference()
        let academiesRoot = databaseRoot.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
        let eventsRoot = academyId.child("Events")
        let eventId = eventsRoot.childByAutoId()
        let eventToUpload = ["name":eventName.text!,"date":date.text!,"time":time.text!,"coach":coach.text!,
                             "description":txtDescription.text!,"price":price.text!,"availableSeats":seatTxt.text!,
                             "discount":DiscountTxt.text!, "image":eventImgString] as [String : Any]
            
        eventId.setValue(eventToUpload)
    }
    
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
