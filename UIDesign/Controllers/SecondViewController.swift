//
//  SecondViewController.swift
//  UIDesign
//
//  Created by Shivani Gupta on 31/05/22.
//

import UIKit
class SecondViewController: UIViewController {
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var momentCollectionView: UICollectionView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var momentView: UIView!
    @IBOutlet weak var memoryButton: UIButton!
    @IBOutlet weak var letsGoView: UIView!
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var settingView: UIImageView!
    @IBOutlet weak var notificationView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var uploadBtn: UIButton!
    @IBOutlet weak var swipeGesture: UISwipeGestureRecognizer!
    
    var menuValue = false
    var home = CGAffineTransform()
    var currentMonth:String=""
    var currentDate:String=""
    var currentMonthDay:Int = 0
    
    var dateArray:[Int] = []
    var previousDateArray:[Int] = []
    var imagesArray:[String] = ["addBtn","screen_new","s1","s3","screen_new"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Date().month
        currentDate = Date().day
        currentMonthDay = Date().getDaysInMonth()
    
        memoryButton.layer.cornerRadius = 20
        momentView.layer.cornerRadius = 20
        letsGoView.layer.cornerRadius = 20
        uploadBtn.layer.cornerRadius = 10
       
        home = self.containerView.transform
    
        for i in 1...currentMonthDay {
            dateArray.append(i)
        }
        
        // for open navigation menu
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
          menuImageView.isUserInteractionEnabled = true
          menuImageView.addGestureRecognizer(tapGestureRecognizer)
          
        // for notication
        let tapGestureRecognizerfForNotification = UITapGestureRecognizer(target: self, action: #selector(notificationImageTapped(tapGestureRecognizer:)))
        notificationView.isUserInteractionEnabled = true
        notificationView.addGestureRecognizer(tapGestureRecognizerfForNotification)
     
        // for setting
        let tapGestureRecognizerForSetting = UITapGestureRecognizer(target: self, action: #selector(settingImageTapped(tapGestureRecognizer:)))
        settingView.isUserInteractionEnabled = true
        settingView.addGestureRecognizer(tapGestureRecognizerForSetting)
        
        //for lets go button
        let tapGestureRecognizerForLetsGo = UITapGestureRecognizer(target: self, action: #selector(letsGoViewTapped(tapGestureRecognizer:)))
        letsGoView.isUserInteractionEnabled = true
        letsGoView.addGestureRecognizer(tapGestureRecognizerForLetsGo)
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        self.containerView.layer.cornerRadius = 40
       showMenu(containerView: containerView)
    }
    
    @objc func notificationImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"NotificationViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func settingImageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc func letsGoViewTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"GoMomentViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func showGestureMenu(_ sender: UISwipeGestureRecognizer) {
        if menuValue == false && swipeGesture.direction == .right {
         print("user is showing menu")
         self.containerView.layer.cornerRadius = 40
         showMenu(containerView: containerView)
         menuValue = true
            
        }
        
    }
    
    @IBAction func hideMenu(_ sender: Any) {
        if menuValue == true {
        print("user is hiding menu")
        closeMenu(containerView: containerView,home: home)
        menuValue = false
            
        }
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
      closeMenu(containerView: containerView,home: home)
       // closeMenu1()
         }
       
    @IBAction func momentButton(_ sender: Any) {
       closeMenu(containerView: containerView,home: home)
     }
    
    @IBAction func homeButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"viewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
       
     }
    
    @IBAction func memoryBookButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"ThirdViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func contactButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"SettingViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func logoutButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"LauncherViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
    @IBAction func closeMomentButton(_ sender: Any) {
        momentView.isHidden = true
     }
    
    @IBAction func creatMemoryButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil);
        let vc = storyboard.instantiateViewController(withIdentifier:"MemoryMomentViewController")
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
     }
    
}

extension SecondViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == dateCollectionView){
        return dateArray.count
            
        }else if(collectionView == momentCollectionView){
            return imagesArray.count
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
               cell.dateView.backgroundColor = .white
               
           }else{
               cell.dateView.backgroundColor = UIColor(named: "DateBg")
               cell.dateLabel.textColor = UIColor(named: "DateText")
               cell.monthLabel.textColor = UIColor(named: "DateText")
           }

            return cell
           
       }else if(collectionView == imageCollectionView){
           
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "circleCell", for: indexPath as IndexPath) as! CircleImageCollectionViewCell
         cell.circleImageView.layer.cornerRadius = 25
    
           if imagesArray.count > 0 {
               let image = imagesArray[indexPath.row]
         //   cell.circleImageView.image = UIImage(named: imagesArray[indexPath.row])

           }
               return cell

           
       }else{

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "momentCell", for: indexPath as IndexPath) as! MomentCollectionViewCell
            cell.imageView.layer.cornerRadius = 30
            
           if(indexPath.row == 0){
               cell.shareBtn.isHidden = true
           }else{
               cell.shareBtn.isHidden = false
           }
           if imagesArray.count > 0 {
               let image = imagesArray[indexPath.row]
               cell.imageView.image = UIImage(named: imagesArray[indexPath.row])
            
           }
                return cell
        }
        
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if(collectionView == dateCollectionView){
            return CGSize(width: collectionView.bounds.size.width * 0.15, height: collectionView.bounds.size.height)
            
        }else if(collectionView == imageCollectionView){
            return CGSize(width: collectionView.bounds.size.height , height: collectionView.bounds.size.height  )
        }else{
//            var myInt = indexPath.row
//            if(myInt % 2 == 0){
            let size = (collectionView.frame.size.width ) / 2
                return CGSize(width: size, height: size)
//            return CGSize(width: collectionView.bounds.size.width * 0.7 , height: collectionView.bounds.size.height)
//            }else{
//                return CGSize(width: collectionView.bounds.size.width * 0.7, height: collectionView.bounds.size.height)
//            }
    
           
        }
    }
    
   
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 5
//    }
    
    
}


extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: self)
    }
    
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    
    func getDaysInMonth() -> Int{
        let calendar = Calendar.current

        let dateComponents = DateComponents(year: calendar.component(.year, from: self), month: calendar.component(.month, from: self))
        let date = calendar.date(from: dateComponents)!

        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count

        return numDays
    }

}



