import UIKit
import FirebaseFirestore
import Kingfisher


class Network_VC: UIViewController {

    @IBOutlet weak var collection_view: UICollectionView!
    
    var profiles: [Profile] = []
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register collection view cell if not already registered
        self.collection_view.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collection_view.collectionViewLayout = UICollectionViewFlowLayout()
        
        // Fetch profiles from Firestore
        fetchProfiles()
    }
    
    func fetchProfiles() {
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                for document in querySnapshot!.documents {
                    let data = document.data()
                    let name = data["name"] as? String ?? ""
                    let job = data["userField"] as? String ?? ""
                    let imageUrl = data["userProfileImg"] as? String ?? ""
                    let bprofile = data["userField"] as? String ?? ""
                    let uid = document.documentID
                    // Using document ID as UID
                    
                    let profile = Profile(name: name, job: job, imageUrl: imageUrl, bprofile: bprofile, uid: uid)
                    self.profiles.append(profile)
                }
                
                DispatchQueue.main.async {
                    self.collection_view.reloadData()
                }
            }
        }
    }
}

extension Network_VC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        let profile = profiles[indexPath.row]
        cell.configure(with: profile.imageUrl, name: profile.name, job: profile.job, bprofile: profile.bprofile)
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        vc.uid = profiles[indexPath.row].uid  // Pass uid to ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumInteritemSpacing - 10
        return CGSize(width: widthPerItem, height: 280)
    }
}

struct Profile {
    let name: String
    let job: String
    let imageUrl: String
    let bprofile: String
    let uid: String
    
    // Add uid as a property

    // Optionally, you might want to add an initializer to handle the new property:
    init(name: String, job: String, imageUrl: String, bprofile: String, uid: String) {
        self.name = name
        self.job = job
        self.imageUrl = imageUrl
        self.bprofile = bprofile
        self.uid = uid
    }
}

