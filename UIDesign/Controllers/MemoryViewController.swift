//
//  MemoryViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 15/06/22.
//

import UIKit
import XLPagerTabStrip

class MemoryViewController:UIViewController{
    
    override func viewDidLoad() {
        
    }
    
}

extension MemoryViewController:IndicatorInfoProvider{
   
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "MemoryBooks")
    }
    
}
