//
//  ViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//
import SideMenu
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var momentCollectionView: UICollectionView!
    @IBOutlet weak var contactCollectionView: UICollectionView!
    @IBOutlet weak var settingView: UIImageView!
    @IBOutlet weak var notificationView: UIImageView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var swipeGesture: UISwipeGestureRecognizer!
    
    var menuValue = false
    var home = CGAffineTransform()
    
    var imagesArray:[String] = ["screen_new","screen_new","screen_new","screen_new","screen_new"]
    var contactNameArray:[String] = ["Mike Wazowski","Mike Wazowski","Mike Wazowski","Mike Wazowski"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        momentCollectionView.dataSource = self
        momentCollectionView.delegate = self
        
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
        
        registerNib()
    
    }
    
    func registerNib() {
        let nib1 = UINib(nibName: ImageCollectionViewCell.nibName, bundle: nil)
        momentCollectionView?.register(nib1, forCellWithReuseIdentifier: ImageCollectionViewCell.reuseIdentifier)
        
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

    @IBAction func showGestureMenu(_ sender: UISwipeGestureRecognizer) {
        if menuValue == false && swipeGesture.direction == .right {
         print("user is showing menu")
         self.containerView.layer.cornerRadius = 40
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
       
    @IBAction func homeButton(_ sender: Any) {
       closeMenu(containerView: containerView,home: home)
     }
    
    @IBAction func momentButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SecondViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
       
     }
    
    @IBAction func memoryBookButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"ThirdViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
       
    @IBAction func contactButton(_ sender: Any) {
       
     }
    
    
    @IBAction func logoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LauncherViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    // for status bar colour
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == momentCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ImageCollectionViewCell
            cell.imageView.layer.cornerRadius = 20
            
            if imagesArray.count > 0 {
                let image = imagesArray[indexPath.row]
                cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
                
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
        if(collectionView == momentCollectionView){
            return CGSize(width: collectionView.bounds.size.width * 0.7, height: collectionView.bounds.size.height)
        }else{
            return CGSize(width: collectionView.bounds.size.width * 0.7, height: collectionView.bounds.size.height)
        }
    }
    
    
    
}




