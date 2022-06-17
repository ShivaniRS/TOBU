//
//  LoginViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 13/06/22.
//


import UIKit

class LoginViewController :UIViewController{
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    var iconClick = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 20
            
        }
    
    
    @IBAction func registerButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"CreateAccountViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func loginBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"viewController")
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
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
}
