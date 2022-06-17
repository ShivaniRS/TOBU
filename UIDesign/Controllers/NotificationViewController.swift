//
//  NotificationViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 15/06/22.
//


import UIKit

class NotificationViewController: UIViewController{
 
    
    override func viewDidLoad() {
        
    }
    
   
    @IBAction func viewButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"UserProfileViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
}
