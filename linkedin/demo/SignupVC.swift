//
//  SignupVC.swift
//  linkedin
//
//  Created by Apple 13 on 6/21/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignupVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    weak var delegate: SendDataBack?

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func actLogin(_ sender: UIButton) {
//        let email = self.emailTF.text!
//        let pass = self.passwordTF.text!
//        guard validation(email: email) else {
//            print("Enter Correct email")
//            return
//        }
//        
//        delegate?.sendDataToPreviousVC(email: email, password: pass)
//        navigationController?.popViewController(animated: true)
        signUpWithFirebase()

    }
    
    @IBAction func actBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    func signUpWithFirebase(){
        guard let email = self.emailTF.text, !email.isEmpty,
              let password = self.passwordTF.text, !password.isEmpty else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){(authResult, error) in
            if let nsError = error as NSError?{
                if let errorCode = AuthErrorCode.Code(rawValue: nsError.code){
                    switch errorCode{
                    case .invalidEmail:
                        print("Invalid Email")
                    case .emailAlreadyInUse:
                        print("email is already in use")
                    case .weakPassword:
                        print("week password")
                    default:
                        print("out of range")
                    }
                    
                }else{
                    print("Login successful")
                }
            }
            
            let uuid = authResult?.user.uid
            print(uuid!)
            let db = Firestore.firestore()
            
            db.collection("user").document(uuid!).setData([
                "name":"tarun lohar",
                "mobile":"8000970578",
                "city": "kankroli"
            ]){error in
                if let error = error{
                    print("Error saving user data: \(error.localizedDescription)")
                }else{
                    print("User details save successfully!")
                }
            }
        }
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
