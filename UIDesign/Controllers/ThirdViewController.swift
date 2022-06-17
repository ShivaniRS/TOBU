//
//  ThirdViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//

import UIKit
import XLPagerTabStrip

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var mCollectionView: UICollectionView!{
        didSet {
                // Configure Collection View
                mCollectionView.delegate = self
                mCollectionView.dataSource = self

                // Create Collection View Layout
                mCollectionView.collectionViewLayout = createLayout()

            }
    }
    @IBOutlet weak var cCollectionView: UICollectionView!
    @IBOutlet weak var captureView: UIView!
    @IBOutlet weak var viewView: UIView!
    @IBOutlet weak var editView: UIView!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var settingView: UIImageView!
    @IBOutlet weak var notificationView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var swipeGesture: UISwipeGestureRecognizer!
    
    var menuValue = false
    var home = CGAffineTransform()
    var tempCellAttributesArray = [UICollectionViewLayoutAttributes]()
    let leftEdgeInset: CGFloat = 10
    
    var imagesArray:[String] = ["screen_new","screen_new","screen_new","screen_new","screen_new","screen_new"]
    var contactNameArray:[String] = ["Mike Wazowski","Mike Wazowski","Mike Wazowski","Mike Wazowski"]
    var heights = [160.0,100.0,100.0,100.0,100.0,160.0] as [CGFloat]
    var width = [160.0,80.0,40.0,40.0,80.0,160.0] as [CGFloat]

    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        captureView.layer.cornerRadius = 25
        viewView.layer.cornerRadius = 10
        editView.layer.cornerRadius = 10
        shareView.layer.cornerRadius = 10
  
        cCollectionView.dataSource = self
        cCollectionView.delegate = self
        home = self.containerView.transform
        
        // for open navigation menu
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          menuImageView.isUserInteractionEnabled = true
          menuImageView.addGestureRecognizer(tapGestureRecognizer)
        
        // for notication
        let tapGestureRecognizerfForNotification = UITapGestureRecognizer(target: self, action: #selector(notificationImageTapped(tapGestureRecognizer:)))
        notificationView.isUserInteractionEnabled = true
        notificationView.addGestureRecognizer(tapGestureRecognizerfForNotification)
        
        // for setting
        let tapGestureRecognizerForSetting = UITapGestureRecognizer(target: self, action: #selector(settingImageTapped(tapGestureRecognizer:)))
        settingView.isUserInteractionEnabled = true
        settingView.addGestureRecognizer(tapGestureRecognizerForSetting)
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.containerView.layer.cornerRadius = 40
        showMenu(containerView: containerView)
    }
    
    @objc func notificationImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"NotificationViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func settingImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    

    @IBAction func showGestureMenu(_ sender: UISwipeGestureRecognizer) {
        if menuValue == false && swipeGesture.direction == .right {
         print("user is showing menu")
         containerView.layer.cornerRadius = 40
         showMenu(containerView: containerView)
         menuValue = true
            
        }
        
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        if menuValue == true {
        print("user is hiding menu")
        closeMenu(containerView: containerView,home: home)
        menuValue = false
            
        }
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
      closeMenu(containerView: containerView,home: home)
       // closeMenu1()
         }
       
    @IBAction func memoryBookButton(_ sender: Any) {
       closeMenu(containerView: containerView,home: home)
     }
    
    @IBAction func homeButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"viewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
       
     }
    
    @IBAction func contactButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func momentButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SecondViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func logoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LauncherViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
       
    private func createLayout() -> UICollectionViewCompositionalLayout{
         //item
         let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)))
        
        let item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)))
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        item1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        

        let verticalGroup1 = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                       heightDimension: .fractionalWidth(1)
                   ),
                   subitems:  [item,item1]
               )
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                       heightDimension: .fractionalWidth(1)
                   ),
                   subitems:  [item1,item]
               )
        

        //group
        let verticalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1)
            ),
          subitems: [verticalGroup1,verticalGroup2]

        )
      
        //section
         let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
     }

    
}

extension ThirdViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == mCollectionView){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleCell", for: indexPath as IndexPath) as! CircleImageCollectionViewCell
          
            cell.circleImageView.layer.cornerRadius = 5
           
        if imagesArray.count > 0 {
            let image = imagesArray[indexPath.row]
            cell.circleImageView.image = UIImage(named: imagesArray[indexPath.row])
           
        }
 
            return cell
            
        }else{
           
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellContact", for: indexPath as IndexPath) as! ContactCollectionViewCell
            cell.contactView.layer.cornerRadius = 20
            cell.imageViewPerson.layer.cornerRadius = 20

            if imagesArray.count > 0 {
                let image = imagesArray[indexPath.row]
                //cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
            
               
            }
                return cell
        }
        
    
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == mCollectionView){
            let size = Int(collectionView.frame.size.width)
        return CGSize(width: size, height: size)

        }else{
            return CGSize(width: collectionView.bounds.size.width * 0.7, height: collectionView.bounds.size.height)
        }
    }
    

    
}

extension ThirdViewController:IndicatorInfoProvider{
   
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MemoryBooks")
    }
    
}


