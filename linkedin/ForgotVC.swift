//
//  ForgotVC.swift
//  linkedin
//
//  Created by Apple 17 on 15/06/24.
//

import UIKit

class ForgotVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBOutlet weak var TF_Email: UITextField!
    
    
    @IBOutlet weak var TF_NewPassword: UITextField!
    
    @IBOutlet weak var TF_ConfirmPassword: UITextField!
    
    @IBAction func BT_RecoverNow(_ sender: UIButton) {
        let email = TF_Email.text ?? ""
        let password = TF_NewPassword.text ?? ""
        let confirmPassword = TF_ConfirmPassword.text ?? ""
        
        guard isValidEmail(email) else {
            showAlert(title: "Invalid Email", message: "Please enter a valid email address.")
            return
        }
        
        guard isValidPassword(password) else {
            showAlert(title: "Invalid Password", message: "Password must be at least 8 characters long.")
            return
        }
        
        guard password == confirmPassword else {
            showAlert(title: "Passwords Mismatch", message: "Passwords do not match. Please re-enter your password.")
            return
        }
        
        print("Password reset successful")
    }


           func isValidEmail(_ email: String) -> Bool {
               let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
               return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
           }

           func isValidPassword(_ password: String) -> Bool {
               return password.count >= 8
           }

           func showAlert(title: String, message: String) {
               let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alertController.addAction(okAction)
               present(alertController, animated: true, completion: nil)
           }
       }
