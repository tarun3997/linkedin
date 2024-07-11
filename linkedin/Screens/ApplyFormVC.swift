import UIKit
import FirebaseAuth
import FirebaseFirestore
import FirebaseStorage



class ApplyFormVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        image.addGestureRecognizer(tapGesture)
        image.isUserInteractionEnabled = true
        
        imagePicker.delegate = self
                    
        
        
        
        self.BT_Next.layer.cornerRadius = 17.5
        self.image.layer.cornerRadius = min(image.bounds.width, image.bounds.height) / 2
        image.layer.masksToBounds = true
    }
    let imagePicker = UIImagePickerController()

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var BT_Next: UIButton!
    @IBOutlet weak var TF_email: UITextField!
    @IBOutlet weak var TF_number: UITextField!

    @IBAction func BT_Next(_ sender: Any) {
        guard let email = TF_email.text, !email.isEmpty else {
            showAlert(message: "Please enter your email.", title: "Validation error")
            return
        }

        guard isValidEmail(email) else {
            showAlert(message: "Please enter a valid email address.", title: "Validation error")
            return
        }

        guard let number = TF_number.text, !number.isEmpty else {
            showAlert(message: "Please enter your phone number.",title: "Validation error")
            return
        }

        guard isValidPhoneNumber(number) else {
            showAlert(message: "Please enter a valid phone number.",title: "Validation error")
            return
        }
//
//        print("Applied successfully")
        
        ApplyForm()
    }
    
    @objc func imageViewTapped(){
        presentImagePicker()
    }
    
    func presentImagePicker(){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
    }

    func isValidEmail(_ email: String) -> Bool {
        return email.contains("@") && email.contains(".")
    }

    func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }

    func showAlert(message: String, title: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func ApplyForm(){
        guard let email = TF_email.text, let number = TF_number.text else {

            return
        }
        
        
        let db = Firestore.firestore()
        
        let storage = Storage.storage()
        let uid = "bqx3zm78Q9NHCQ5LZLvHO4DMDYN2"
        
       
        let imageName = "\(uid)_\(UUID().uuidString).jpg"
        let imageRef = storage.reference().child("images").child(imageName)
        
        
        guard let imageData = image.image?.jpegData(compressionQuality: 0.5) else {
            print("Failed to convert UIImage to Data.")
            return
        }
        
        
        imageRef.putData(imageData, metadata: nil) { (metadata, error) in
            if let error = error {
                print("Error uploading image to storage: \(error.localizedDescription)")
                return
            }
            
            
            imageRef.downloadURL { (url, error) in
                guard let downloadURL = url else {
                    if let error = error {
                        print("Error getting download URL: \(error.localizedDescription)")
                    }
                    return
                }
                
               
                db.collection("forms").document(uid).setData([
                    "email": email,
                    "MobileNumber": number,
                    "imageUrl": downloadURL.absoluteString  // Store image download URL
                ]) { [self] error in
                    if let error = error {
                        print("Error in saving user details:", error.localizedDescription)
                    } else {
                        self.showAlert(message: "Applied details saved successfully", title: "Applied successfull")
                    
                        print("Applied details saved successfully")
                    }
                }
            }
        }
    }

}


extension ApplyFormVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage{
        image.image = pickedImage
    }
    dismiss(animated: true, completion: nil)
}
    func imagePickerController(_ picker: UIImagePickerController){
        dismiss(animated: true, completion: nil)
        
    }
    
    }

