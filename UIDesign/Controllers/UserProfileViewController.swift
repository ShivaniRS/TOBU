//
//  UserProfileViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 17/06/22.
//

import UIKit

class UserProfileViewController:UIViewController{
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var saveChangeBtn: UIButton!
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    var iconClick = false
    
    override func viewDidLoad() {
        saveChangeBtn.layer.cornerRadius = 20
    }
    
    @IBAction func saveChangeButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LauncherViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func showPasswordButton(_ sender: Any) {
        if(iconClick == false) {
           password.isSecureTextEntry = false
            showHidePasswordBtn.setImage(UIImage(named: "eye"), for: .normal)
            
            
           iconClick = true
        } else {
            password.isSecureTextEntry = true
            showHidePasswordBtn.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        
           iconClick = false
        }
         
     }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
}
