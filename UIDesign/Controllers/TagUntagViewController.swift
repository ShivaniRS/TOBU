//
//  TagUntagViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 13/06/22.
//

import UIKit

class TagUntagViewController:UIViewController{
    
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var nameArray:[String] = ["Mike Wazowski","Mike Wazowski","Mike Wazowski","Mike Wazowski"]
    var imagesArray:[String] = ["screen_new","s1","s3","screen_new","s1"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
    
        doneBtn.layer.cornerRadius = 20
        doneBtn.setTitle("Send", for: .normal)
        titleLabel.text = "Choose People you want to Send"
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
         }
       
    @IBAction func doneButton(_ sender: Any) {
      
         }
   
}

    extension TagUntagViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
        
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return nameArray.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTag", for: indexPath as IndexPath) as! TagUntagCollectionViewCell
                cell.imageView.layer.cornerRadius = 20
            //for set padding in button images
            cell.tagBtn.imageView?.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
                
                if nameArray.count > 0 {
                    cell.nameText.text = nameArray[indexPath.row]
                    let image = imagesArray[indexPath.row]
                    cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
                }
            
            if(indexPath.row == 0){
                cell.tagBtn.setImage(UIImage(named: "lightPlus"), for: .normal)
            }else{
                cell.tagBtn.setImage(UIImage(named: "iconsMinus"), for: .normal)
            }
                return cell
                
                
            
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
            return CGSize(width: collectionView.bounds.size.width * 0.9, height: collectionView.bounds.size.height)
            
        }
        
        
        
    }

