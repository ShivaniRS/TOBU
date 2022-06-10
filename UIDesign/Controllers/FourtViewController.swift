//
//  FourtViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 07/06/22.
//

import UIKit

class FourthViewController: UIViewController, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.identifier, for: indexPath as IndexPath) as! MyCollectionViewCell
         return cell
    }
    
    private let layout = UICollectionViewFlowLayout()
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

    override func viewDidLoad() {
           super.viewDidLoad()
       
           setupCollectionView()
       }
    
    
    private func createLayout() -> UICollectionViewCompositionalLayout{
         //item
         let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.6)))
        
        let item1 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4)))
        
//        let item2 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(0.4), heightDimension: .fractionalHeight(01)))
//
//        let item4 = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1/2), heightDimension: .fractionalHeight(-1)))
        
//
       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        item1.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
//        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
//                    layoutSize: NSCollectionLayoutSize(
//                        widthDimension: .fractionalWidth(1),
//                        heightDimension: .fractionalHeight(0.4)
//                    ),
//                    subitems:[item1,item2]
//
//                )
        
        let verticalGroup1 = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                       heightDimension: .fractionalWidth(1)
                   ),
       //             subitems: [item, verticalStackGroup]
                   subitems:  [item,item1]
               )
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(
                   layoutSize: NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                       heightDimension: .fractionalWidth(1)
                   ),
       //             subitems: [item, verticalStackGroup]
                   subitems:  [item1,item]
               )
        
//        //item
//        let verticalStackItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//         widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.5)))
//
//        verticalStackItem.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
//
//        let verticalStackGroup = NSCollectionLayoutGroup.vertical(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1/3),
//                heightDimension: .fractionalHeight(1)
//            ),
//            subitem: verticalStackItem,
//            count:2
//        )
//
//
//        let tripletItem = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
//            widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
//
//
//        let tripletHorizontalGroup = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalWidth(0.3)
//            ),
//            subitem: tripletItem,
//            count:3
//        )
//
//         //group
//         let horizontalGroup = NSCollectionLayoutGroup.horizontal(
//             layoutSize: NSCollectionLayoutSize(
//                 widthDimension: .fractionalWidth(1.0),
//                 heightDimension: .fractionalWidth(0.5)
//             ),
////             subitems: [item, verticalStackGroup]
//             subitems: [item, item1,item2]
//         )
//
//        let horizontalGroup1 = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1.0),
//                heightDimension: .fractionalWidth(0.5)
//            ),
////             subitems: [item, verticalStackGroup]
//            subitems:  [item1,item2,item4]
//        )
//
//
//        let horizontalGroup12 = NSCollectionLayoutGroup.vertical(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(1),
//                heightDimension: .fractionalWidth(0.5)
//            ),
////             subitems: [item, verticalStackGroup]
//            subitems:  [item1,item2,item4]
//        )
//
//        let horizontalGroup13 = NSCollectionLayoutGroup.horizontal(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(0.5),
//                heightDimension: .fractionalWidth(0.5)
//            ),
////             subitems: [item, verticalStackGroup]
//            subitems:  [item1,item2]
//        )
//
//        let verticalGroup1 = NSCollectionLayoutGroup.vertical(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(0.5),
//                heightDimension: .fractionalWidth(1)
//            ),
//         //  subitems: [horizontalGroup,tripletHorizontalGroup]
//          subitems: [item,horizontalGroup13]
//
//        )
//
//        let verticalGroup2 = NSCollectionLayoutGroup.vertical(
//            layoutSize: NSCollectionLayoutSize(
//                widthDimension: .fractionalWidth(0.5),
//                heightDimension: .fractionalWidth(1)
//            ),
//         //  subitems: [horizontalGroup,tripletHorizontalGroup]
//          subitems: [horizontalGroup13,item]
//
//        )
//
        //group
        let verticalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalWidth(1)
            ),
         //  subitems: [horizontalGroup,tripletHorizontalGroup]
          subitems: [verticalGroup1,verticalGroup2]

        )

        
         //section
         let section = NSCollectionLayoutSection(group: verticalGroup)
        
        return UICollectionViewCompositionalLayout(section: section)
     }

    private func setupCollectionView() {
           view.addSubview(collectionView)
        collectionView.frame = view.bounds
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.identifier)
           collectionView.dataSource = self
       }

       private func setupCollectionViewConstraints() {
           // your collectionView constraints setup
       }
}

class MyCollectionViewCell: UICollectionViewCell{
    static let identifier = "MyCollectionViewCell"
    
    private let imageView:UIImageView = {
        let imageview = UIImageView()
        imageview.clipsToBounds = true
        imageview.contentMode = .scaleToFill
        return imageview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        
        var images:[UIImage] = [
            UIImage(named: "s1"),
            UIImage(named: "s1"),
            UIImage(named: "screen_new"),
            UIImage(named: "s3"),
            UIImage(named: "screen_new"),
        ].compactMap({$0})
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
}
