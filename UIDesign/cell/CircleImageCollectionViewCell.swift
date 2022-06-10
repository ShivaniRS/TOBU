//
//  CircleImageCollectionViewCell.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//

import UIKit

class CircleImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var circleImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // circleImageView.layer.cornerRadius = self.contentView.bounds.size.width/2
        circleImageView.clipsToBounds = true
        circleImageView.frame = contentView.bounds
        circleImageView.contentMode = .scaleToFill
    }
    
    class var reuseIdentifier: String {
        return "circleCell"
    }
    class var nibName: String {
        return "CircleImageCollectionViewCell"
    }
}
