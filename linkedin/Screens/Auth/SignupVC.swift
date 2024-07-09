//
//  SignupVC.swift
//  linkedin
//
//  Created by Apple 17 on 12/06/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupVC: UIViewController {
    
    var isWrongName = false;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    @IBOutlet weak var TF_Email: UITextField!
    
    
    
    
    
    
    @IBOutlet weak var TF_CPassword: UITextField!
    
    
    
    @IBAction func BT_Welcome(_ sender: UIButton) {
        
        //        let email = self.TF_Email.text!
        //        let password = self.TF_Password.text!
        //
        //
        //        guard name.isEmpty == false else {
        //            isWrongName = true
        //            let attributedString = NSMutableAttributedString(string: "Enter Name*")
        //            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 10, length: 1)) // Changing color of *
        //            self.NameLabel.attributedText = attributedString
        //            print("Enter Name*")
        //            return
        //        }
        //
        //
        //        let attributedString = NSMutableAttributedString(string: "Enter Name*")
        //        attributedString.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 10, length: 1)) // Resetting color of *
        //        self.NameLabel.attributedText = attributedString
        //
        //        guard email.isEmpty == false else {
        //            print("Enter Email")
        //            return
        //        }
        //
        //        guard mnumber.isEmpty == false else {
        //            print("Enter Mobile Number")
        //            return
        //        }
        //
        //        guard password.isEmpty == false else {
        //            print("Enter Password")
        //            return
        //        }
        //
        //        guard cpassword.isEmpty == false else {
        //            print("Enter Confirm Password")
        //            return
        //        }
        //
        //        guard password == cpassword  else {
        //            print("Password Mismatch")
        //            return
        //        }
        //
        //        print ("Login Success")
        //
        //
        //    }
        //
        
        signup_firebase()
        
    }
    
    
    func signup_firebase() {
        guard let email = self.TF_Email.text, !email.isEmpty,
              let password = self.TF_CPassword.text, !password.isEmpty else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error as NSError? {
                let errorCode = AuthErrorCode.Code(rawValue: error.code)
                
                switch errorCode {
                case .invalidEmail:
                    print("Invalid email format.")
                case .emailAlreadyInUse:
                    print("Email is already in use.")
                case .weakPassword:
                    print("Password is too weak.")
                default:
                    print("Unknown error: \(error.localizedDescription)")
                }
            } else {
                print("Signup successful")
                
            }
        }
        
    }
    
}
