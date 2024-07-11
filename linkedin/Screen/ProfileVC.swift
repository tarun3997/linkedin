import UIKit
import FirebaseFirestore

class ProfileVC: UIViewController {
    
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Opento: UIButton!
    @IBOutlet weak var Addsection: UIButton!
    
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var address: UILabel!
    
    var uid: String?
    
    let imagepicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageViewTapped))
        Image.addGestureRecognizer(tapGesture)
        Image.isUserInteractionEnabled = true

        imagepicker.delegate = self
        
        self.Addsection.layer.cornerRadius = 15
        self.Opento.layer.cornerRadius = 15
        self.Addsection.layer.borderColor = UIColor.systemBlue.cgColor
        self.Addsection.layer.borderWidth = 1
        Image.layer.cornerRadius = 75
        Image.layer.masksToBounds = true
        Image.clipsToBounds = true
        
        fetchFirebaseData()
    }
    
    @objc func imageViewTapped() {
        presentImagePicker()
    }
    
    func presentImagePicker() {
        imagepicker.sourceType = .photoLibrary
        present(imagepicker, animated: true, completion: nil)
    }
    
    func fetchFirebaseData() {
        guard let uid = uid else {
            print("UID is nil, cannot fetch data.")
            return
        }
        
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (document, error) in
            if let error = error {
                print("Error fetching document: \(error)")
                return
            }
            
            guard let document = document, document.exists else {
                print("Document does not exist")
                return
            }
            
            // Document data is available
            if let data = document.data() {
                if let username = data["username"] as? String {
                    self.username.text = username
                }
                
                if let address = data["City"] as? String {
                    self.address.text = address
                }
                
                if let imageUrl = data["userProfileImg"] as? String {
                    // Assuming imageUrl is a valid URL string
                    // You may want to load the image asynchronously
                    if let url = URL(string: imageUrl) {
                        URLSession.shared.dataTask(with: url) { (data, response, error) in
                            if let data = data {
                                DispatchQueue.main.async {
                                    self.Image.image = UIImage(data: data)
                                }
                            }
                        }.resume()
                    }
                }
            }
        }
    }
}

extension ProfileVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            Image.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
