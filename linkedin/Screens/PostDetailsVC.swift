//
//  PostDetailsVC.swift
//  linkedin
//
//  Created by Apple 13 on 6/12/24.
//

import UIKit

class PostDetailsVC: UIViewController {

    var name = String()
    var postData: [String: Any] = [:]
 
    @IBOutlet weak var table_view: UITableView!
    @IBOutlet weak var bottomUserImage: UIImageView!
    @IBAction func backButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
//    @IBAction func actFollowButton(_ sender: UIButton) {
//        isFollowing.toggle()
//        updateFollowButtonUI()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.table_view.register(UINib(nibName: "PostDetailCell", bundle: nil), forCellReuseIdentifier: "PostDetailCell")
        self.table_view.register(UINib(nibName: "CommentsCell", bundle: nil), forCellReuseIdentifier: "CommentsCell")

        
//        self.nameLabel.text = postData["username"] as? String
//                self.userField.text = postData["userField"] as? String
//                self.postTime.text = postData["userPostTime"] as? String
//        self.postDesc.text = postData["postDesc"] as? String
                if let imageName = postData["userProfileImg"] as? String {
                    self.bottomUserImage.image = UIImage(named: imageName)
                }
//        if let postImg = postData["userPostImg"] as? String {
//            self.postImage.image = UIImage(named: postImg)
//        }
//        updateFollowButtonUI()
        // Do any additional setup after loading the view.
    }
    
//    func updateFollowButtonUI() {
//          let followTitle = isFollowing ? "Following" : "Follow"
//          let followColor = isFollowing ? UIColor.lightGray : UIColor.blue
//          followButton.setTitle(followTitle, for: .normal)
//          followButton.setTitleColor(followColor, for: .normal)
//      }
    

}

extension PostDetailsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = self.table_view.dequeueReusableCell(withIdentifier: "PostDetailCell") as! PostDetailCell
            cell.username.text = postData["username"] as? String
            if let imageName = postData["userProfileImg"] as? String {
                                cell.userImage.image = UIImage(named: imageName)
                            }
            if let imageName = postData["userPostImg"] as? String {
                                cell.userPostImage.image = UIImage(named: imageName)
                            }
            cell.userfield.text = postData["userField"] as? String
            cell.postTime.text = postData["userPostTime"] as? String
            cell.userPostDecs.text = postData["postDesc"] as? String
            return cell
        }else{
            let cell = self.table_view.dequeueReusableCell(withIdentifier: "CommentsCell") as! CommentsCell
            
            return cell
        }
        
    }
    
    
}
