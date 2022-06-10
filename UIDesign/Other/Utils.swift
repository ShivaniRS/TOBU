//
//  Utils.swift
//  UIDesign
//
//  Created by Shivani Gupta on 03/06/22.
//

import Foundation
import UIKit

/* show navigation drawer with animation*/
func showMenu( containerView : UIView){
    
    let screen = UIScreen.main.bounds
    containerView.layer.cornerRadius = 40
    let x = screen.width * 0.8
    let originalTransform = containerView.transform
    let scaledTransform = originalTransform.scaledBy(x: 0.8, y: 0.8)
    let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
    UIView.animate(withDuration: 0.7, animations: {
    containerView.transform = scaledAndTranslatedTransform
    })
}

/* hide navigation drawer with animation*/
func closeMenu(containerView : UIView,home:CGAffineTransform){
   
    UIView.animate(withDuration: 0.7, animations: {
     containerView.transform = home
     containerView.layer.cornerRadius = 0
      
    })
}
