//
//  EditProfileVC.swift
//  linkedin
//
//  Created by FCP30 on 14/06/24.
//

import UIKit

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
    
    
    
    @IBAction func actSaveBtn(_ sender: UIButton){
        guard let fname = TF_Firstname.text, !fname.isEmpty else {
            showAlert(message: "Please enter your first name.")
            return
        }
        print(self.TF_Firstname.text!)
        
        guard let lname = TF_Lastname.text, !lname.isEmpty else {
            showAlert(message: "Please enter your last name.")
            return
        }
        print(self.TF_Lastname.text!)
        
        guard let aname = TF_Addname.text, !aname.isEmpty else {
            showAlert(message: "Please enter your additional name.")
            return
        }
        print(self.TF_Addname.text!)
        
        guard let ed = TF_Education.text, !ed.isEmpty else {
            showAlert(message: "Please enter your education.")
            return
        }
        print(self.TF_Education.text!)
        
        guard let city = TF_City.text, !city.isEmpty else {
            showAlert(message: "Please enter your city.")
            return
        }
        print(self.TF_City.text!)
      
        print("Profile Edit Successfully")

    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    

}
