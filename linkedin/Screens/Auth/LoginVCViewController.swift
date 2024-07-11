//
//  LoginVCViewController.swift
//  linkedin
//
//  Created by Apple 17 on 12/06/24.
//

import UIKit
import FirebaseAuth

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
            
        if email.isEmpty || password.isEmpty {
                    showAlert(message: "Please enter both email & passord.")
                    return
                }

                Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                    if let error = error {
                        print("Error logging in: \(error.localizedDescription)")
                        self.showAlert(message: "Error logging in. Please check your credentials and try again.")
                        return
                    }

                    // User successfully logged in
                    print("Login successful!")
                    // Example: Navigate to another view controller upon successful login
                    // self.performSegue(withIdentifier: "LoggedInSegue", sender: nil)

                    // Optionally save user email to UserDefaults
                    UserDefaults.standard.setValue(email, forKey: "email")
                }
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
