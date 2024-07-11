//
//  EditProfileVC.swift
//  linkedin
//
//  Created by FCP30 on 14/06/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class EditProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.BT_save.layer.cornerRadius = 15
        

    }
    
    
    
    @IBOutlet weak var BT_save: UIButton!
    
    
    
    @IBOutlet weak var TF_Firstname: UITextField!
    
    @IBOutlet weak var TF_Lastname: UITextField!
    
    @IBOutlet weak var TF_Addname: UITextField!
    
    @IBOutlet weak var TF_Education: UITextField!

    @IBOutlet weak var TF_City: UITextField!
    
    @IBOutlet weak var TF_Profession: UITextField!
    
    
    @IBAction func actSaveBtn(_ sender: UIButton) {
        guard let fname = TF_Firstname.text, !fname.isEmpty else {
            showAlert(message: "Please enter your first name.")
            return
        }
        guard let lname = TF_Lastname.text, !lname.isEmpty else {
            showAlert(message: "Please enter your last name.")
            return
        }
        guard let aname = TF_Addname.text, !aname.isEmpty else {
            showAlert(message: "Please enter your additional name.")
            return
        }
        guard let ed = TF_Education.text, !ed.isEmpty else {
            showAlert(message: "Please enter your education.")
            return
        }
        guard let city = TF_City.text, !city.isEmpty else {
            showAlert(message: "Please enter your city.")
            return
        }
        guard let pro = TF_Profession.text, !pro.isEmpty else {
            showAlert(message: "Please enter your profession.")
            return
        }
        
  
        let db = Firestore.firestore()
        let userId = "bqx3zm78Q9NHCQ5LZLvHO4DMDYN2"
        
        let userRef = db.collection("users").document(userId)
        
        userRef.updateData([
            "name": fname,
            "username": lname,
            "MobileNumber": aname,
            "Education": ed,
            "userFiled":pro,
            "City": city
            
        ]) { err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
                DispatchQueue.main.async {
                    print("Profile Updated successfully")
                }
            }
        }
    }


    func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
