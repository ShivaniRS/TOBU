//
//  AboutMomentViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 12/06/22.
//


import UIKit

class AboutMomentViewController: UIViewController{
    
    @IBOutlet weak var locationText:UILabel!
    @IBOutlet weak var imageview:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // for add right image in password field
        let locationImage =  UIImage(named:"location")
       // addRightImage(locationText,locationImage)
        
        imageview.layer.cornerRadius = 20
        
    }
    
    
    func addRightImage(textField:UILabel, img:UIImage){
        
        let rightImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        rightImageView.image = img
      //  textField.add = rightImageView
       // textField.rightViewMode = .always
        
        
    }
    
    @IBAction func addTagButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SaveMemoryVieController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
}
