//
//  ImageCollectionViewCell.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        imageView.layer.cornerRadius = 20
    }
    
    class var reuseIdentifier: String {
        return "cell"
    }
    class var nibName: String {
        return "ImageCollectionViewCell"
    }

}
