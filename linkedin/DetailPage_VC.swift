import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage

class DetailPage_VC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        UserProfile.addGestureRecognizer(tapGesture)
        UserProfile.isUserInteractionEnabled = true
        
        imagePicker.delegate = self
        
        self.UserProfile.layer.cornerRadius = min(UserProfile.bounds.width, UserProfile.bounds.height) / 2
        UserProfile.layer.masksToBounds = true
        
    }
    
    let imagePicker = UIImagePickerController()
    
    @IBOutlet weak var UserProfile: UIImageView!
    @IBOutlet weak var TF_FirstName: UITextField!
    @IBOutlet weak var TF_LastName: UITextField!
    @IBOutlet weak var TF_MobileNumber: UITextField!
    @IBOutlet weak var TF_Education: UITextField!
    @IBOutlet weak var TF_Profession: UITextField!
    @IBOutlet weak var TF_City: UITextField!
    
    @IBAction func BT_Save(_ sender: UIButton) {
        if validateFields() {
            guard let uid = UserDefaults.standard.string(forKey: "uid") else {
                print("UID not found in UserDefaults.")
                return
            }
            
            uploadImageAndSaveData(uid: uid)
        } else {
            print("Validation failed. Please check the entered data.")
        }
    }
    
    func validateFields() -> Bool {
        return true
    }
    
    @objc func imageViewTapped() {
        presentImagePicker()
    }
    
    func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func uploadImageAndSaveData(uid: String) {
        guard let image = UserProfile.image else {
            print("Profile image is nil.")
            return
        }
        
        
        let storageRef = Storage.storage().reference().child("profile_images/\(uid).jpg")
        
        // Convert the image to Data format
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert image to Data format.")
            return
        }
        
        // Upload the image to Firebase Storage
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading profile image:", error.localizedDescription)
                return
            }
            
            // Once the image is uploaded, get the download URL
            storageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    print("Failed to get download URL:", error?.localizedDescription ?? "Unknown error")
                    return
                }
                
                // Save user details including the profile image URL to Firestore
                self.saveUserData(uid: uid, profileImageURL: downloadURL.absoluteString)
            }
        }
    }
    
    func saveUserData(uid: String, profileImageURL: String) {
        guard let firstname = self.TF_FirstName.text, !firstname.isEmpty,
              let lastname = self.TF_LastName.text, !lastname.isEmpty,
              let mobilenumber = self.TF_MobileNumber.text, !mobilenumber.isEmpty,
              let education = self.TF_Education.text, !education.isEmpty,
              let profession = self.TF_Profession.text, !profession.isEmpty,
              let city = self.TF_City.text, !city.isEmpty
        else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users").document(uid).setData([
            "name": firstname,
            "username": lastname,
            "MobileNumber": mobilenumber,
            "Education": education,
            "userField": profession,
            "userProfileImg": profileImageURL,
            "City": city
        ]) { error in
            if let error = error {
                print("Error in saving user details:", error.localizedDescription)
            } else {
                print("User details saved successfully")
                UserDefaults.standard.removeObject(forKey: "uid")
            }
        }
    }
}

extension DetailPage_VC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            UserProfile.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
