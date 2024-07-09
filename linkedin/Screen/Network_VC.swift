//
//  Network_VC.swift
//  linkedin
//
//  Created by Apple 3 on 15/06/24.
//

import UIKit

class Network_VC: UIViewController {

    @IBOutlet weak var collection_view: UICollectionView!
    
    let imageArr = [UIImage(named: "Ranveer.jpeg"),UIImage(named: "lordshiva.jpeg"),UIImage(named: "rathore.jpeg"),UIImage(named: "birds.jpeg"),]
    let nameArr = ["Ranveer", "Digvijay","Saurabh","Rahul"]
    let jobArr = ["Human Resources", "Directing Manager","RRB po","engineer"]
    let bpprofileArr = ["based on your profile","based on your profile","based on your profile","based on your profile"]
        override func viewDidLoad() {
        super.viewDidLoad()
            
 
    
  self.collection_view.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
            collection_view.collectionViewLayout = UICollectionViewFlowLayout ()
    }
    

}
extension Network_VC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collection_view.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
            
      
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 15
        cell.Ranveer.layer.cornerRadius = 50

        cell.Ranveer.image = self.imageArr[indexPath.row]
        cell.pname.text = self.nameArr[indexPath.row]
        cell.jobprofession.text = self.jobArr[indexPath.row]
        cell.bprofile.text = self.bpprofileArr[indexPath.row]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    }
    
extension Network_VC: UICollectionViewDelegateFlowLayout {
    
   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.8, left: 3.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        
        let widthPerItem = collectionView.frame.width / 2 - layout.minimumInteritemSpacing - 10
        return CGSize(width: widthPerItem, height: 280)
    }
}



