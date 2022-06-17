//
//  GoMomentViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 17/06/22.
//

import UIKit

class GoMomentViewController:UIViewController{
    
    @IBOutlet weak var godMomemtButton: UIButton!
    
    override func viewDidLoad() {
        godMomemtButton.layer.cornerRadius = 20
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
    
    @IBAction func goMomentBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"UserProfileViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
}
