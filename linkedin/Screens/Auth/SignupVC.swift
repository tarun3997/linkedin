//
//  SignupVC.swift
//  linkedin
//
//  Created by Apple 17 on 12/06/24.
//

import UIKit

class SignupVC: UIViewController {
    
    var isWrongName = false;


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    


    @IBOutlet weak var TF_EnterName: UITextField!
    

    @IBOutlet weak var TF_Email: UITextField!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    @IBOutlet weak var TF_MNumber: UITextField!
    
    
    

    @IBOutlet weak var TF_Password: UITextField!
    
    
    @IBOutlet weak var TF_CPassword: UITextField!
    
    
    
    @IBAction func BT_Welcome(_ sender: UIButton) {
        
        let name = self.TF_EnterName.text!
        let email = self.TF_Email.text!
        let mnumber = self.TF_MNumber.text!
        let password = self.TF_Password.text!
        let cpassword = self.TF_CPassword.text!
        
        
        guard name.isEmpty == false else {
            isWrongName = true
            let attributedString = NSMutableAttributedString(string: "Enter Name*")
                    attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 10, length: 1)) // Changing color of *
                    self.NameLabel.attributedText = attributedString
            print("Enter Name*")
            return
        }
        
        
        let attributedString = NSMutableAttributedString(string: "Enter Name*")
          attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 10, length: 1)) // Resetting color of *
          self.NameLabel.attributedText = attributedString
        
        guard email.isEmpty == false else {
            print("Enter Email")
            return
        }
        
        guard mnumber.isEmpty == false else {
            print("Enter Mobile Number")
            return
        }
        
        guard password.isEmpty == false else {
            print("Enter Password")
            return
        }
        
        guard cpassword.isEmpty == false else {
            print("Enter Confirm Password")
            return
        }
        
        guard password == cpassword  else {
            print("Password Mismatch")
            return
        }
        
        print ("Login Success")
        
        
    }
    
    
    @IBAction func BT_Back(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "LoginVCViewController") as! LoginVCViewController
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
}
