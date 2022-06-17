//
//  InitialTobuMomentViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 08/06/22.
//

import UIKit

class InitialTobuMomentViewController: UIViewController{
    
    @IBOutlet weak var notificationView: UIImageView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var swipeGesture: UISwipeGestureRecognizer!
    
    var menuValue = false
    var home = CGAffineTransform()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        home = self.containerView.transform
        
        // for open navigation menu
      let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        menuImageView.isUserInteractionEnabled = true
        menuImageView.addGestureRecognizer(tapGestureRecognizer)
        
        // for notication
        let tapGestureRecognizerForNotification = UITapGestureRecognizer(target: self, action: #selector(notificationImageTapped(tapGestureRecognizer:)))
        notificationView.isUserInteractionEnabled = true
        notificationView.addGestureRecognizer(tapGestureRecognizerForNotification)
    }
    
    
    // for status bar colour
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
    self.containerView.layer.cornerRadius = 40
    showMenu(containerView: containerView)
    }
    
    @objc func notificationImageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"NotificationViewController")
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"ViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func logoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LauncherViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
}
