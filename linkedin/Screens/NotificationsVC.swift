//
//  NotificationsVC.swift
//  linkedin
//
//  Created by FCP30 on 12/06/24.
//

import UIKit

class NotificationsVC: UIViewController {
    
    let NotificationData: [[String:Any]] = [
        [
        "UserImage": "Image-1",
        "UserName" : "Shah Rukh Khan: Kajol like your post and commented on your post",
        "MessageTime": "2hr",
    
    ],
        [
        "UserImage": "Image-2",
        "UserName" : "Noora Fathehi: sohil khan comment on your post",
        "MessageTime": "1hr",
    
    ],
        [
        "UserImage": "Image",
        "UserName" : "Yo Yo Honey Singh : Raftar like your post",
        "MessageTime": "2hr",
    
    ],
    ]

    @IBOutlet weak var table_view: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table_view.register(UINib(nibName: "NotificationLists", bundle: nil), forCellReuseIdentifier: "NotificationLists")

        // Do any additional setup after loading the view.
    }
    


}

extension NotificationsVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.table_view.dequeueReusableCell(withIdentifier: "NotificationLists", for: indexPath) as! NotificationLists
        
        let post = self.NotificationData[indexPath.row]
        cell.UserImage.image = UIImage(named: post["UserImage"] as! String)
        cell.UserName.text = post["UserName"] as? String
        cell.MessageTime.text = post["MessageTime"] as? String
        return cell
    }
    
    
}
