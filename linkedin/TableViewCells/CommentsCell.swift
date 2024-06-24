//
//  CommentsCell.swift
//  linkedin
//
//  Created by Apple 13 on 6/14/24.
//

import UIKit

class CommentsCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var userImage: RoundImageView!
    
    @IBOutlet weak var postTime: UILabel!
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var userField: UILabel!
    
    @IBOutlet weak var userComments: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
