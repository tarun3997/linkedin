//
//  LoginVC.swift
//  linkedin
//
//  Created by Apple 13 on 6/21/24.
//

import UIKit

class LoginVC: UIViewController, SendDataBack {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func actLogin(_ sender: UIButton) {
        print("deon")
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
     
    }
    @IBOutlet weak var emailLB: UILabel!
    
    @IBOutlet weak var passwordLB: UILabel!
    
    func sendDataToPreviousVC(email: String, password: String) {
            emailLB.text = "Email: \(email)"
            passwordLB.text = "Password: \(password)"
        }
}
