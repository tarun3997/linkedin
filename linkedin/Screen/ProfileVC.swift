//
//  ProfileVC.swift
//  linkedin
//
//  Created by Apple 3 on 12/06/24.
//

import UIKit

class ProfileVC: UIViewController {

    
    @IBOutlet weak var ellipse: UIImageView!
    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var Opento: UIButton!
    @IBOutlet weak var Addsection: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Addsection.layer.cornerRadius = 15
        self.Opento.layer.cornerRadius = 15
        self.Addsection.layer.borderColor = UIColor.systemBlue.cgColor
        self.Addsection.layer.borderWidth = 1
        self.ellipse.layer.borderColor = UIColor.black.cgColor
        self.ellipse.layer.borderWidth = 1
        Image.layer.cornerRadius = Image.bounds.width / 2
        Image.layer.masksToBounds = true
        
        Image.layer.cornerRadius = imageView.frame.size.width / 2
        Image.clipsToBounds = true
        ellipse.layer.cornerRadius = ellipse.bounds.height / 2
        ellipse.layer.masksToBounds = true
        Image.layer.borderWidth = 1
           // Image.layer.masksToBounds = false
            //Image.layer.borderColor = UIColor.black.cgColor
            //Image.layer.cornerRadius = Image.frame.height/2
            //Image.clipsToBounds = true    }
    }

  
}
