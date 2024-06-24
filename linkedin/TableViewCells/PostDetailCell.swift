//
//  PostDetailCell.swift
//  linkedin
//
//  Created by Apple 13 on 6/15/24.
//

import UIKit

class PostDetailCell: UITableViewCell {

    @IBOutlet weak var userImage: RoundImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var followbtn: UIButton!
    
    @IBOutlet weak var userfield: UILabel!
    
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var userPostDecs: UILabel!
    
    @IBOutlet weak var userPostImage: UIImageView!
    
    var isFollowing = false

    @IBAction func actFollowAndUnFollow(_ sender: UIButton) {
        isFollowing.toggle()
        updateFollowButtonUI()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFollowButtonUI()
        // Initialization code
    }
    
    func updateFollowButtonUI() {
              let followTitle = isFollowing ? "Following" : "Follow"
              let followColor = isFollowing ? UIColor.lightGray : UIColor.blue
              followbtn.setTitle(followTitle, for: .normal)
              followbtn.setTitleColor(followColor, for: .normal)
          }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
