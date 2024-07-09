import UIKit
import FirebaseFirestore
import FirebaseStorage

class AddPostVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imgViewTapped))
        imgView.addGestureRecognizer(tapGesture)
        imgView.isUserInteractionEnabled = true

        imagePicker.delegate = self
    }

    let imagePicker = UIImagePickerController()

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var PostDescTF: UITextField!

    @IBAction func actPostBTN(_ sender: UIButton) {
        guard let image = imgView.image else {
            print("Image is not selected")
            return
        }

        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            print("Failed to get image data")
            return
        }

        let postDescription = PostDescTF.text ?? ""
        uploadPost(imageData: imageData, description: postDescription)
    }

    @objc func imgViewTapped() {
        presentImagePicker()
    }

    func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }

    func uploadPost(imageData: Data, description: String) {
        let storageRef = Storage.storage().reference()
        let imageName = UUID().uuidString
        let uid = "udRSe2WWNuU5LGtIVKkbu2OgweM2"
        let imageRef = storageRef.child("\(uid)/\(imageName).jpg")

        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
                return
            }

            imageRef.downloadURL { url, error in
                if let error = error {
                    print("Error getting download URL: \(error.localizedDescription)")
                    return
                }

                guard let imageURL = url else {
                    print("Error: Image URL is nil")
                    return
                }

                self.savePostToFirestore(imageURL: imageURL.absoluteString, description: description)
            }
        }
    }

    func savePostToFirestore(imageURL: String, description: String) {
        let db = Firestore.firestore()
        let uid = "udRSe2WWNuU5LGtIVKkbu2OgweM2"
        let postData: [String: Any] = [
            "imageURL": imageURL,
            "description": description,
            "timestamp": Timestamp(),
            "id": uid
        ]

        db.collection("posts").addDocument(data: postData) { error in
            if let error = error {
                print("Error saving post data: \(error.localizedDescription)")
            } else {
                print("Post saved successfully!")
            }
        }
    }
}

extension AddPostVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            imgView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
