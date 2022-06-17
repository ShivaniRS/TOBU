//
//  MomentsViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 15/06/22.
//


import UIKit
import XLPagerTabStrip

class MomentsViewController: UIViewController{
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var momentCollectionView: UICollectionView!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var dateText: UILabel!
    @IBOutlet weak var addMomentView: UIView!
    @IBOutlet weak var selectedMomemtBtn: UIButton!
    var selectedIndex = -1
    
    var currentMonth:String=""
    var currentDate:String=""
    var currentMonthDay:Int = 0
    var dateArray:[Int] = []
    var previousDateArray:[Int] = []
    var imagesArray:[String] = ["screenshort","screen_new","s1","s3","screen_new"]
    
    override func viewDidLoad() {
        
        selectedMomemtBtn.layer.cornerRadius = 20
        currentMonth = Date().month
        currentDate = Date().day
        currentMonthDay = Date().getDaysInMonth()
       // momentCollectionView.sec = UIEdgeInsets(top: 10, left: 27, bottom: 10, right: 27)
        
        for i in 1...currentMonthDay {
            dateArray.append(i)
        }
    }
    

    @IBAction func selectDateButton(_ sender: Any) {
       
     }
    
    @IBAction func shareButton(_ sender: Any) {
       
     }
    
    
}

extension MomentsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == dateCollectionView){
        return dateArray.count
            
        }else{
            return imagesArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
       
       if(collectionView == dateCollectionView){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath as IndexPath) as! DateCollectionViewCell

            cell.dateLabel.text = String(dateArray[indexPath.row])
            cell.monthLabel.text = currentMonth
            cell.dateView.layer.cornerRadius = 25
           
           if(indexPath.row + 1 == Int(currentDate)){
               cell.dateView.backgroundColor = UIColor(named: "Yellow")
              
           }else if((indexPath.row + 1) <  Int(currentDate) ?? 0){
               cell.dateView.backgroundColor = UIColor(named: "dateBg1")
               
           }else{
               cell.dateView.backgroundColor = UIColor(named: "DateBg")
               cell.dateLabel.textColor = UIColor(named: "DateText")
               cell.monthLabel.textColor = UIColor(named: "DateText")
           }

            return cell
           
           
       }else{

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "momentCell", for: indexPath as IndexPath) as! MomentCollectionViewCell
            cell.imageView.layer.cornerRadius = 30
            
            cell.shareBtn.isHidden = true

           if imagesArray.count > 0 {
               let image = imagesArray[indexPath.row]
               cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
            
           }
                return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (collectionView == momentCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "momentCell", for: indexPath as IndexPath) as! MomentCollectionViewCell
            
            let selectedImage = indexPath.row
            print(">>>selectedImage" , indexPath.row)
            if indexPath.row == selectedImage{
                cell.shareBtn.isHidden = false
            }else{
                cell.shareBtn.isHidden = true
            }
               // cell?.layer.borderColor = UIColor.gray.cgColor
//            if cell.isSelected == true{
//                cell.shareBtn.isHidden = false
//            }else{
//                cell.shareBtn.isHidden = true
//            }
        }else{
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dateCell", for: indexPath as IndexPath) as! DateCollectionViewCell
            
            
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == dateCollectionView){
            return CGSize(width: collectionView.bounds.size.width * 0.15, height: collectionView.bounds.size.height)
        }else{
            let size = (collectionView.frame.size.width ) / 2
                return CGSize(width: size, height: size)

        }
    }

}

extension MomentsViewController:IndicatorInfoProvider{
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Moments")
    }
}
