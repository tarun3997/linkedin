import UIKit
import FirebaseAuth
import FirebaseFirestore


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
            showAlert(message: "Please enter your email.")
            return
        }

        guard isValidEmail(email) else {
            showAlert(message: "Please enter a valid email address.")
            return
        }

        guard let number = TF_number.text, !number.isEmpty else {
            showAlert(message: "Please enter your phone number.")
            return
        }

        guard isValidPhoneNumber(number) else {
            showAlert(message: "Please enter a valid phone number.")
            return
        }

        print("Applied successfully")
    }
    
    @objc func imageViewTapped(){
        presentImagePicker()
    }
    
    func presentImagePicker(){
        imagePicker.sourceType = .photoLibrary
        present(imagePicker,animated: true,completion: nil)
    }

    func isValidEmail(_ email: String) -> Bool {
        // Simple email validation, you can use regex or more complex validation if needed
        return email.contains("@") && email.contains(".")
    }

    func isValidPhoneNumber(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9]{10}$"  // Adjust regex as per your requirements
        let phonePredicate = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phonePredicate.evaluate(with: phone)
    }

    func showAlert(message: String) {
        let alert = UIAlertController(title: "Validation Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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

