//
//  ContactCollectionViewCell.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//

import UIKit

class ContactCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var momentsLabel: UILabel!
    @IBOutlet weak var imageViewShare: UIImageView!
    @IBOutlet weak var imageViewPerson: UIImageView!
    @IBOutlet weak var contactView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contactView.layer.cornerRadius = 25
    }
    
    
    class var reuseIdentifier: String {
        return "ccellContact"
    }
    class var nibName: String {
        return "ContactCollectionViewCell"
    }
    
}
