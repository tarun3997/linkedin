import UIKit
import Alamofire

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
                print("image is not selected")
                return
            }

            guard let imageData = image.jpegData(compressionQuality: 0.5) else {
                print("text is not inserted")
                return
            }

            let parameters: [String: Any] = [
                "postTitle": PostDescTF.text ?? "",
               
            ]

            uploadPost(imageData: imageData, parameters: parameters)
    }


    @objc func imgViewTapped() {
        presentImagePicker()
    }

    func presentImagePicker() {
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func uploadPost(imageData: Data,parameters: [String: Any]){
        
        let apiUrl = "http://localhost:4000/api/post/addpost"
        
       
        
        AF.upload(multipartFormData: { multipartFormData in
                    multipartFormData.append(imageData, withName: "imageUrl", fileName: "image.jpg", mimeType: "image/jpeg")
                    for (key, value) in parameters {
                        if let stringValue = value as? String {
                            multipartFormData.append(stringValue.data(using: .utf8)!, withName: key)
                        }
                    }
                }, to: apiUrl)
                .response { response in
                    debugPrint(response)
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
