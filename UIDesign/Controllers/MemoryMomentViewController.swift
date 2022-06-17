//
//  MemoryMomentViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 15/06/22.
//

import UIKit
import XLPagerTabStrip
import SwiftUI

class MemoryMomentViewController: ButtonBarPagerTabStripViewController{
    
    override func viewDidLoad() {
        loadDesign()
        super.viewDidLoad()
         
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
    
       
        let child1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MomentsViewController")
        
        let child2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MemoryViewController")
        return [child1,child2]
      
    }
    
    func loadDesign(){
        self.settings.style.buttonBarBackgroundColor = .clear
        self.settings.style.buttonBarItemBackgroundColor = .white
        self.settings.style.selectedBarBackgroundColor = UIColor(named: "Blue") ?? .blue
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 2.0
        self.settings.style.buttonBarItemTitleColor = UIColor(named: "DateText")
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = UIColor(named: "Blue")
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 20
        self.settings.style.buttonBarRightContentInset = 20
        
      var changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = UIColor(named: "Blue")
            newCell?.label.textColor = UIColor(named: "Blue")
        }
    }
    
    @IBAction func closeBtn(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
     }
    
    @IBAction func shareBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"TagUntagViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
}

