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
                if let uid = authResult?.user.uid {
                    UserDefaults.standard.set(uid, forKey: "uid")
                    
                }
                let vc = self.storyboard?.instantiateViewController(identifier: "DetailPage_VC") as! DetailPage_VC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }        
    }
    
}
