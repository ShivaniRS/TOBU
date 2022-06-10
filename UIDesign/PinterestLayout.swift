//
//  PinterestLayout.swift
//  UIDesign
//
//  Created by Shivani Gupta on 06/06/22.
//

import Foundation
import UIKit

class PinterestLayout: UICollectionViewCompositionalLayout{
    
//    //item
//    let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//        widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//    
//    //group
//    let group = NSCollectionLayoutGroup.horizontal(
//        layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1),
//            heightDimension: .fractionalHeight(1))
//        ,
//        subitem: item,
//        count:2
//    )
//    
//    //section
    
//    let section = NSCollectionLayoutSection(group: group)
    
    
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
         //item
         let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
             widthDimension: .fractionalWidth(2/3), heightDimension: .fractionalHeight(1)))
         
        item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        //item
        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
         widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
        
        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: verticalStackItem,
            count:2
        )
        
        
        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        
        
        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(0.3)
            ),
            subitem: tripletItem,
            count:3
        )
        
         //group
         let horizontalGroup = NSCollectionLayoutGroup.horizontal(
             layoutSize: NSCollectionLayoutSize(
                 widthDimension: .fractionalWidth(1.0),
                 heightDimension: .fractionalWidth(0.7)
             ),
             subitems: [item, verticalStackGroup]
         )
         
        //group
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1)
            ),
            subitems: [horizontalGroup,tripletHorizontalGroup]
        )
        
        
         //section
         let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
     }

        
}
