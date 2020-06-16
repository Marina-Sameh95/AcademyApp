//
//  EditEvent.swift
//  KidzoonaAcademy
//
//  Created by Marwa Zabara on 5/29/20.
//  Copyright © 2020 Marina Sameh. All rights reserved.
//

import UIKit
import FirebaseStorage
import Kingfisher
import FirebaseDatabase
import FirebaseAuth

class EditEvent: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate{

    let imagePicker = UIImagePickerController()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    var eventObj : EventModel?
    var eventImgString  = ""



    @IBOutlet weak var timeTxt: RoundedTextField!
    @IBOutlet weak var seatsTxt: RoundedTextField!
    @IBOutlet weak var dateTxt: RoundedTextField!
    @IBOutlet weak var priceTxt: RoundedTextField!
    @IBOutlet weak var descTxt: RoundedTextField!
    @IBOutlet weak var locationTxt: RoundedTextField!
    @IBOutlet weak var coachTxt: RoundedTextField!
    @IBOutlet weak var nameTxt: RoundedTextField!
    @IBOutlet weak var eventImg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        displayEventDetails()
        imagePicker.delegate = self
        print("in edit name = \(eventObj?.name)")

        self.navigationController?.isNavigationBarHidden = true

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.parent?.title = ""
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    func displayEventDetails() {
        print("in display")
        eventImgString = eventObj?.image ?? ""
        nameTxt.text = eventObj?.name
        priceTxt.text = eventObj?.price
        locationTxt.text = eventObj?.location
        dateTxt.text = eventObj?.date
        timeTxt.text = eventObj?.time
        coachTxt.text = eventObj?.coach
        descTxt.text = eventObj?.descrption
        seatsTxt.text = eventObj?.availableSeats
        if (eventObj?.image != ""){
            let url = URL(string: (eventObj?.image)!)
            if let url = url as? URL{
                KingfisherManager.shared.retrieveImage(with: url as! Resource, options: nil, progressBlock: nil){ (image , error, cache, coursename) in
                    self.eventImg.setImage(image, for: .normal)
                    //self.eventImg.kf.indicatorType = .activity
                }
            }
            
        }
        else{
            eventImg.setImage(UIImage(named: "noimage"), for: .normal)
            
        }
        
        
    
    }
    @IBAction func increaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        //        if (Int(seatsTxt.text ?? "0") ?? 0 < 95)
        //        {
        let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) + 1
        print(currentSeats as Any)
        seatsTxt.text = String(currentSeats)
    }
    
    @IBAction func decreaseSeats(_ sender: Any) {
        print(seatsTxt.text as Any)
        if (Int(seatsTxt.text ?? "0") ?? 0 > 1)
        {
            let currentSeats = (Int(seatsTxt.text ?? "0") ?? 0) - 1
            print(currentSeats as Any)
            seatsTxt.text = String(currentSeats)
        }
        else
        {
            seatsTxt.text =  "0"
        }
    }
    
    @IBAction func addImg(_ sender: Any) {
        presentImgPicker()
    }
    
    @IBAction func saveBtnPressed(_ sender: Any) {
        let databaseRoot = Database.database().reference()
        let academiesRoot = databaseRoot.child("Academies")
        let userId = Auth.auth().currentUser?.uid
        let academyId = academiesRoot.child(userId!)
        let eventsRoot = academyId.child("Events")
        let eventId = eventsRoot.child((eventObj?.id)!)
        let eventToUpload = ["name":nameTxt.text!,"date":dateTxt.text!,"time":timeTxt.text!,"coach":coachTxt.text!,"description":descTxt.text!,"price":priceTxt.text!,"availableSeats":seatsTxt.text!,
                             "location":locationTxt.text!,"image":eventImgString] as [String : Any]
        eventId.setValue(eventToUpload)
performSegue(withIdentifier: "toEventList", sender: self)
        
    }
    
}
    
extension EditEvent {
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
                    self.eventImgString = downloadURL.absoluteString
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
            eventImg.setImage(pickedImage, for: .normal)
            eventImg.contentMode = .scaleAspectFit
            uploadImageToFirebase(SelectedImg: pickedImage)
        }
        
        dismiss(animated: true, completion: nil)
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

extension EditEvent{
    
    func createDatePicker(){
       dateTxt.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        dateTxt.inputAccessoryView = toolbar
        dateTxt.inputView = datePicker
        datePicker.datePickerMode = .date
        timePicker.datePickerMode = .time
    }
    
    @objc func donePressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        dateTxt.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createTimePicker(){
        timeTxt.textAlignment = .center
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked))
        toolbar.setItems([doneBtn], animated: true)
        
        timeTxt.inputAccessoryView = toolbar
        timeTxt.inputView = timePicker
        timePicker.datePickerMode = .time
    }
    
    @objc func doneClicked(){
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        
        timeTxt.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
    
    
    
}
