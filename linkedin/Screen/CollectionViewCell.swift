//
//  CollectionViewCell.swift
//  linkedin
//
//  Created by Apple 3 on 18/06/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    var isFollowing = false

    @IBOutlet weak var Ranveer: UIImageView!
    @IBOutlet weak var pname: UILabel!
    @IBOutlet weak var jobprofession: UILabel!
    @IBOutlet weak var bprofile: UILabel!
    @IBOutlet weak var followbtn: UIButton!
    
    
    @IBAction func follow(_ sender: UIButton) {
        
    isFollowing.toggle()
        updateFollowButtonUI()
    
    }
    override func awakeFromNib() {
        
        super.awakeFromNib()
        updateFollowButtonUI()
    }

    func updateFollowButtonUI() {
        let followTitle = isFollowing ? "Following" : "Follow"
        followbtn.setTitle(followTitle, for: .normal)
    }
}

 
