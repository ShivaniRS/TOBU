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

 func createLayout1() -> UICollectionViewCompositionalLayout{
     //item
     let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)))
    
    let item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)))
    
    item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    item1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
    

    let verticalGroup1 = NSCollectionLayoutGroup.vertical(
               layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                   heightDimension: .fractionalWidth(1)
               ),
               subitems:  [item,item1]
           )
    
    let verticalGroup2 = NSCollectionLayoutGroup.vertical(
               layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(0.5),
                   heightDimension: .fractionalWidth(1)
               ),
               subitems:  [item1,item]
           )
    

    //group
    let verticalGroup = NSCollectionLayoutGroup.horizontal(
        layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1)
        ),
      subitems: [verticalGroup1,verticalGroup2]

    )
  
    //section
     let section = NSCollectionLayoutSection(group: verticalGroup)
    
    return UICollectionViewCompositionalLayout(section: section)
 }
