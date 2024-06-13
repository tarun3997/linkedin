//
//  NotificationLists.swift
//  linkedin
//
//  Created by FCP30 on 12/06/24.
//

import UIKit

class NotificationLists: UITableViewCell {
    
    
    @IBOutlet weak var UserImage: UIImageView!
    
    @IBOutlet weak var UserName: UILabel!
    
    
    @IBOutlet weak var MessageTime: UILabel!
    
    @IBOutlet weak var threeDots: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        let radius = CGFloat.pi / 2
        threeDots.transform = CGAffineTransform(rotationAngle: radius)
        
        UserImage.layer.cornerRadius = UserImage.bounds.height / 2
        UserImage.layer.masksToBounds = true
    }
    
}

