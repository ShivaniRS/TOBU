//
//  TagUntagCollectionViewCell.swift
//  UIDesign
//
//  Created by Shivani Gupta on 13/06/22.
//


import UIKit

class TagUntagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageView.layer.cornerRadius = 20
    }
    
    

}
