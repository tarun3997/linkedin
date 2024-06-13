import UIKit




class HomeScreenVC: UIViewController {
    
    let postData: [[String: Any]] = [
        [
            "userProfileImg": "user1",
            "username": "eliyana",
            "userField": "software developer",
            "userPostTime": "1hr",
            "postDesc": "creating a new ios app",
            "userPostImg": "post1"
        ],
        [
            "userProfileImg": "user2",
            "username": "Jack",
            "userField": "software developer",
            "userPostTime": "1hr",
            "postDesc": "creating a new ios app",
            "userPostImg": "post1"
        ],
        [
            "userProfileImg": "user3",
            "username": "Jos",
            "userField": "software developer",
            "userPostTime": "1hr",
            "postDesc": "creating a new ios app",
            "userPostImg": "post1"
        ],
    ]
    
    @IBOutlet weak var table_view: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.table_view.register(UINib(nibName: "PostFeedVC", bundle: nil), forCellReuseIdentifier: "PostFeedVC")
        
        
    }
}

extension HomeScreenVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table_view.dequeueReusableCell(withIdentifier: "PostFeedVC", for: indexPath) as! PostFeedVC
        
        let post = self.postData[indexPath.row]
        cell.UserProfieImg.image = UIImage(named: post["userProfileImg"] as! String)
        cell.Username.text = post["username"] as? String
        cell.UserField.text = post["userField"] as? String
        cell.UserPostTime.text = post["userPostTime"] as? String
        cell.PostDescription.text = post["postDesc"] as? String
        cell.UserPostImg.image = UIImage(named: post["userPostImg"] as! String)
        cell.postData = post
        cell.delegate = self
        
        return cell
    }
}

extension HomeScreenVC: PostFeedDelegate {
    func didTapDescription(postData: [String : Any]) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PostDetailsVC") as! PostDetailsVC
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
