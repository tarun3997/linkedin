//
//  ProfileVC.swift
//  linkedin
//
//  Created by Apple 3 on 12/06/24.
//

import UIKit

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Opento: UIButton!
    @IBOutlet weak var Addsection: UIButton!
    
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
    }
    
    @objc func imageViewTapped() {
        presentImagePicker()
    }
    
    func presentImagePicker() {
        imagepicker.sourceType = .photoLibrary
        present(imagepicker, animated: true, completion: nil)
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


    

