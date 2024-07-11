import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {

    var isFollowing = false

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var jobLabel: UILabel!
    @IBOutlet weak var bprofileLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateFollowButtonUI()
    }
    
    func configure(with imageUrl: String, name: String, job: String, bprofile: String) {
        // Load image from URL using Kingfisher
        if let url = URL(string: imageUrl) {
            profileImageView.kf.setImage(with: url)
        }
        nameLabel.text = name
        jobLabel.text = job
        bprofileLabel.text = bprofile
    }

    @IBAction func follow(_ sender: UIButton) {
        isFollowing.toggle()
        updateFollowButtonUI()
        // You can add follow/unfollow logic here if needed
    }
    
    func updateFollowButtonUI() {
        let followTitle = isFollowing ? "Following" : "Follow"
        followButton.setTitle(followTitle, for: .normal)
    }
}
