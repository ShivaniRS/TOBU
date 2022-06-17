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
    var viewType:String!
    
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
        anotherView.isHidden = true
        
//        if viewType == "User"{
//            containerView.isHidden = false
//            
//        }else if(viewType == "User"){
//            anotherView.isHidden = false
//        }
        containerView.isHidden = true
        anotherView.isHidden = true
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
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LoginViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func gmailButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"AboutMomentViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func facebookButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"ActionRequiredViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func twitterButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"InitialTobuMomentViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
   
    @IBAction func checkButton(_ sender: Any) {
    
        if(flag == false){
            checkBtn.setImage(UIImage(named: "checkbox"), for: .selected)
            flag = true
        }else{
            checkBtn.setImage(UIImage(named: "unchecked"), for: .normal)
            flag = false
        }
     }
}
