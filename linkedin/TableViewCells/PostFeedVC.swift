//
//  PostFeedVC.swift
//  linkedin
//
//  Created by Apple 13 on 6/12/24.
//

import UIKit

class PostFeedVC: UITableViewCell {

    @IBOutlet weak var UserProfieImg: UIImageView!
    
    @IBOutlet weak var Username: UILabel!
    
    @IBOutlet weak var UserField: UILabel!
    
    @IBOutlet weak var UserPostTime: UILabel!
    
   
    
    @IBOutlet weak var PostDescription: UILabel!
    
    @IBOutlet weak var UserPostImg: UIImageView!
    
    @IBOutlet weak var ThreeDots: UIButton!
    
    @IBOutlet weak var likeOutlet: UIButton!
    
    var postData: [String: Any]?

    var isLiked = false

    weak var delegate: PostFeedDelegate?

    @IBAction func actLike(_ sender: UIButton) {
        
        isLiked ? likeOutlet.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal) : likeOutlet.setImage(UIImage(systemName: "hand.thumbsup.fill"), for: .normal)
       
                isLiked.toggle()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(descriptionTapped))
                PostDescription.isUserInteractionEnabled = true
                PostDescription.addGestureRecognizer(tapGesture)
    }
    
    @objc func descriptionTapped() {
            guard let postData = postData else { return }
            delegate?.didTapDescription(postData: postData)
        }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    override func layoutSubviews() {
        let radius = CGFloat.pi / 2
        ThreeDots.transform = CGAffineTransform(rotationAngle: radius)
        
        UserProfieImg.layer.cornerRadius = UserProfieImg.bounds.height / 2
        UserProfieImg.layer.masksToBounds = true
    }
    
}
protocol PostFeedDelegate: AnyObject {
    func didTapDescription(postData: [String: Any])
}


