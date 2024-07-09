//
//  DetailPage_VC.swift
//  linkedin
//
//  Created by Apple 17 on 05/07/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class DetailPage_VC: UIViewController {
    
    @IBOutlet weak var TF_FirstName: UITextField!
    @IBOutlet weak var TF_LastName: UITextField!
    @IBOutlet weak var TF_MobileNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func details_firebase() {
        guard let FirstName = self.TF_FirstName.text,!FirstName.isEmpty,
              let LastName = self.TF_LastName.text,!LastName.isEmpty,
              let MobileNumber = self.TF_MobileNumber.text,!MobileNumber.isEmpty else {
            return
        }
        
        if let uid = FirebaseAuth.Auth.auth().currentUser?.uid {
            let db = Firestore.firestore()
            
            db.collection("users").document(uid).setData([
                "First Name": FirstName,
                "Last Name": LastName,
                "Mobile Number": MobileNumber
            ]) { error in
                if let error = error {
                    print("Error saving user details: \(error.localizedDescription)")
                } else {
                    print("User details saved successfully")
                }
            }
        }
    }
}
