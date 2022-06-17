//
//  AddMemberViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 16/06/22.
//

import UIKit

class AddMemberViewController:UIViewController{
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var addContactBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var nameArray:[String] = ["Mike Wazowski","Mike Wazowski","Mike Wazowski","Mike Wazowski"]
    var imagesArray:[String] = ["screen_new","s1","s3","screen_new","s1"]
    
    override func viewDidLoad() {
        doneBtn.layer.cornerRadius = 20
        //for set padding in button images
        addContactBtn.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
    }
    
    @IBAction func closeButton(_ sender: Any) {
     
         }
       
    @IBAction func addContctButton(_ sender: Any) {
      
         }
       
    @IBAction func doneButton(_ sender: Any) {
      
         }
}
extension AddMemberViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTag", for: indexPath as IndexPath) as! TagUntagCollectionViewCell
            cell.imageView.layer.cornerRadius = 15
        //for set padding in button images
        cell.tagBtn.imageView?.layer.transform = CATransform3DMakeScale(0.6, 0.6, 0.6)
            
            if nameArray.count > 0 {
                cell.nameText.text = nameArray[indexPath.row]
                let image = imagesArray[indexPath.row]
                cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
            }
        
            return cell
            
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        return CGSize(width: collectionView.bounds.size.width * 0.9, height: collectionView.bounds.size.height)
        
    }
    
    
    
}
