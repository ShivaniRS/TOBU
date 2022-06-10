//
//  LauncherViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 08/06/22.
//

import UIKit

class LauncherViewController: UIViewController{
    
    @IBOutlet weak var getStartedBtn: UIButton!
    @IBOutlet weak var mailBtn: UIButton!
    @IBOutlet weak var gmailBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var captureBtn: UIButton!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var anotherView: UIView!
    @IBOutlet weak var welcomeText: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStartedBtn.layer.cornerRadius = 20
        containerView.layer.cornerRadius = 20
        anotherView.layer.cornerRadius = 20
        captureBtn.layer.cornerRadius = 10
        
        //for set padding in button images
        mailBtn.layer.cornerRadius = 10
        mailBtn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        gmailBtn.layer.cornerRadius = 10
        gmailBtn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        facebookBtn.layer.cornerRadius = 10
        facebookBtn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        twitterBtn.layer.cornerRadius = 10
        twitterBtn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        checkBtn.layer.cornerRadius = 10
        checkBtn.imageView?.layer.transform = CATransform3DMakeScale(0.4, 0.4, 0.4)
        
        containerView.isHidden = true
        //anotherView.isHidden = true
    
    }
    
    @IBAction func getStartedButton(_ sender: Any) {
        welcomeText.text = "Get Started!"
        if(containerView.isHidden == true){
            containerView.isHidden = false
        }else{
            containerView.isHidden = true
        }
     }
    
    @IBAction func haveAccountButton(_ sender: Any) {
        welcomeText.text = "Welcome Back!"
        if(containerView.isHidden == true){
            containerView.isHidden = false
        }else{
            containerView.isHidden = true
        }
     }
    
    @IBAction func mailButton(_ sender: Any) {
     
     }
    
    @IBAction func gmailButton(_ sender: Any) {
     
     }
    
    @IBAction func facebookButton(_ sender: Any) {
     
     }
    
    @IBAction func twitterButton(_ sender: Any) {
     
     }
   
    @IBAction func checkButton(_ sender: Any) {
    
        if(flag == false){
            checkBtn.setImage(UIImage(named: "checkbox"), for: .selected)
            flag = true
        }else{
            checkBtn.setImage(UIImage(named: "unchecked"), for: .normal)
            flag = false
        }

//        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
//            (sender as AnyObject).transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//
//               }) { (success) in
//                   UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
//                       sender.isSelected = !sender.isSelected
//                       sender.transform = .identity
//                   }, completion: nil)
//               }
     }
}
