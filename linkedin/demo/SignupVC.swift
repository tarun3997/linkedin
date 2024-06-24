//
//  SignupVC.swift
//  linkedin
//
//  Created by Apple 13 on 6/21/24.
//

import UIKit

class SignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    weak var delegate: SendDataBack?

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func actLogin(_ sender: UIButton) {
        let email = self.emailTF.text!
        let pass = self.passwordTF.text!
        guard validation(email: email) else {
            print("Enter Correct email")
            return
        }
        
        delegate?.sendDataToPreviousVC(email: email, password: pass)
        navigationController?.popViewController(animated: true)

    }
    
    @IBAction func actBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}

protocol SendDataBack: AnyObject{
    func sendDataToPreviousVC(email: String, password: String)
}

extension SignupVC{
    func validation(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}
