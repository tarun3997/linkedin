//
//  LoginVCViewController.swift
//  linkedin
//
//  Created by Apple 17 on 12/06/24.
//

import UIKit

class LoginVCViewController: UIViewController {

    var isEmailEmpty = true
    var isPasswordEmpty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var TF_Email: UITextField!
    
     @IBOutlet weak var TF_Password: UITextField!
    
    
    
    @IBAction func BT_Login(_ sender: UIButton) {
            let email = self.TF_Email.text!
            let password = self.TF_Password.text!
            
            if email.isEmpty {
                showAlert(message: "Please enter your email.")
                return
            }
            
            if password.isEmpty {
                showAlert(message: "Please enter your password.")
                return
            }
        
        result = email
        print(result ?? "")
        
        
            print("Login Success")
        }
    
    @IBAction func BT_ForgotPassword(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "LoginVCViewController") as! LoginVCViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func BT_Register(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyBoard.instantiateViewController(identifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
        
    
        
        
    }
    
    func showAlert(message: String) {
            let alertController = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(okAction)
            present(alertController, animated: true, completion: nil)
        }
    
    
    
}

extension UIViewController {
    
    var result: String? {
          get {
              return UserDefaults.standard.string(forKey: "email")
          }
          set(newVal) {
              UserDefaults.standard.setValue(newVal, forKey: "email")
          }
      }
}
