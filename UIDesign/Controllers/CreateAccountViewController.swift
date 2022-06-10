//
//  CreateAccountViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 10/06/22.
//

import UIKit

class CreateAccountViewController :UIViewController{
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var creatAccount: UIButton!
    @IBOutlet weak var showHidePasswordBtn: UIButton!
    var iconClick = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for add left image in password field
        let passwordImage =  UIImage(named: "eye")
       // addLeftImage(textField: password, img: passwordImage!)
        
        creatAccount.layer.cornerRadius = 20
            
        }
    
    func addLeftImage(textField:UITextField, img:UIImage){
        
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
        textField.rightView = rightImageView
        textField.rightViewMode = .always
        
        
    }
    
    
    @IBAction func creatAcntButton(_ sender: Any) {
       
     }
    
    @IBAction func loginButton(_ sender: Any) {
       
     }
    
    @IBAction func showPasswordButton(_ sender: Any) {
        if(iconClick == false) {
           password.isSecureTextEntry = false
            showHidePasswordBtn.setImage(UIImage(named: "eye"), for: .selected)
            
           iconClick = true
        } else {
            password.isSecureTextEntry = true
            showHidePasswordBtn.setImage(UIImage(named: "eye.slash"), for: .normal)
           iconClick = false
        }
         
     }
}
