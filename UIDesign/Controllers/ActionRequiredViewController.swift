//
//  ActionRequiredViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 13/06/22.
//

import UIKit

class ActionRequiredViewController:UIViewController{
    
    @IBOutlet weak var saveChangesBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    @IBOutlet weak var chatBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var whatsappBtn: UIButton!
    @IBOutlet weak var saveTobuBtn: UIButton!
    @IBOutlet weak var titleText: UILabel!
    @IBOutlet weak var subTitleText: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var shareMomentView: UIView!
    
    @IBOutlet weak var mCollectionView: UICollectionView!{
        didSet {
                // Configure Collection View
                mCollectionView.delegate = self
                mCollectionView.dataSource = self

                // Create Collection View Layout
            mCollectionView.collectionViewLayout = createLayout1()

            }
    }
    
    var imagesArray:[String] = ["screen_new","screen_new","screen_new","screen_new","screen_new","screen_new"]
    
  //  var screenType: String = "Share"
    var screenType: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        saveChangesBtn.layer.cornerRadius = 20
        shareMomentView.layer.cornerRadius = 20
        saveTobuBtn.layer.cornerRadius = 20
        
        if screenType == "Share"{
            titleText.text = "Share Memomry Book"
            subTitleText.text = "Select one or more memory books to share"
            saveChangesBtn.isHidden = true
        }else{
            titleText.text = "Action Required"
            subTitleText.text = "Answer Question for moments you have captured    "
            saveChangesBtn.isHidden = false
        }
    }
    
    @IBAction func saveChangeButton(_ sender: Any) {
        shareMomentView.isHidden = false
        mainView.backgroundColor = UIColor(named: "actionBg")
         }
    
    @IBAction func closeButton(_ sender: Any) {
        shareMomentView.isHidden = true
        mainView.backgroundColor = UIColor.systemBackground
         }
    
    @IBAction func mailButton(_ sender: Any) {
        mailBtn.setImage(UIImage(named: "emailDark"), for: .normal)
        chatBtn.setImage(UIImage(named: "chatCircle"), for: .normal)
        twitterBtn.setImage(UIImage(named: "twitterCircle"), for: .normal)
        whatsappBtn.setImage(UIImage(named: "whatsapp"), for: .normal)
         }
    
    @IBAction func chatButton(_ sender: Any) {
        chatBtn.setImage(UIImage(named: "chatDark"), for: .normal)
        mailBtn.setImage(UIImage(named: "emailCircle"), for: .normal)
        twitterBtn.setImage(UIImage(named: "twitterCircle"), for: .normal)
        whatsappBtn.setImage(UIImage(named: "whatsapp"), for: .normal)
         }
    
    @IBAction func twitterButton(_ sender: Any) {
        twitterBtn.setImage(UIImage(named: "twitterDark"), for: .normal)
        mailBtn.setImage(UIImage(named: "emailCircle"), for: .normal)
        chatBtn.setImage(UIImage(named: "chatCircle"), for: .normal)
        whatsappBtn.setImage(UIImage(named: "whatsapp"), for: .normal)
         }
    
    @IBAction func whatsappButton(_ sender: Any) {
        whatsappBtn.setImage(UIImage(named: "whatsappDark"), for: .normal)
        mailBtn.setImage(UIImage(named: "emailCircle"), for: .normal)
        chatBtn.setImage(UIImage(named: "chatCircle"), for: .normal)
        twitterBtn.setImage(UIImage(named: "twitterCircle"), for: .normal)
         }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
    
}

extension ActionRequiredViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleCell", for: indexPath as IndexPath) as! CircleImageCollectionViewCell
          
            cell.circleImageView.layer.cornerRadius = 5
           
        if imagesArray.count > 0 {
            let image = imagesArray[indexPath.row]
            cell.circleImageView.image = UIImage(named: imagesArray[indexPath.row])
           
        }
 
            return cell
            
}

    

    
}

