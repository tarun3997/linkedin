//
//  LoginVCViewController.swift
//  linkedin
//
//  Created by Apple 17 on 12/06/24.
//

import UIKit

class LoginVCViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

     @IBOutlet weak var TF_Email: UITextField!
    
     @IBOutlet weak var TF_Password: UITextField!
    
    
    @IBAction func BT_Login(_ sender: UIButton) {
        let email = self.TF_Email.text!
        let password = self.TF_Password.text!
        
        guard email.isEmpty == false else {
            print("Enter Email")
            return
        }
        
        guard password.isEmpty == false else {
            print("Enter Password")
            return
        }
        
        print("Login Success")
    }
    

    
}
