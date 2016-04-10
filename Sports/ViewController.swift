//
//  ViewController.swift
//  Sports
//
//  Created by Chad on 4/9/16.
//  Copyright © 2016 CT. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var imageScrollView: UIScrollView!
    var imagesArray = ["tennis.png", "soccer.png","basketball.png","football.png","hockey"]
    var imageLabel: UILabel!
    
    var sportsDict = [String:CTSportName]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tennis = CTSportName() //empty
        tennis.name = "Tennis"
        tennis.image = "tennis.png"
        self.sportsDict[tennis.name] = tennis
        
        let soccer = CTSportName() //empty
        soccer.name = "Soccer"
        soccer.image = "soccer.png"
        self.sportsDict[soccer.name] = soccer
        
        let basketball = CTSportName() //empty
        basketball.name = "Baketball"
        basketball.image = "basketball.png"
        self.sportsDict[basketball.name] = basketball
        
        let football = CTSportName() //empty
        football.name = "Football"
        football.image = "football.png"
        self.sportsDict[football.name] = football
        
        let hockey = CTSportName() //empty
        hockey.name = "Hockey"
        hockey.image = "hockey.png"
        self.sportsDict[hockey.name] = hockey
        
        
        self.edgesForExtendedLayout = .None
        self.imageScrollView.backgroundColor = UIColor.redColor()
        self.imageScrollView.delegate = self
        
        let w = self.imagesArray.count*Int(self.imageScrollView.frame.size.width)
        self.imageScrollView.contentSize = CGSize(width: w, height: 0)
        self.imageScrollView.pagingEnabled = true
        
        for image in imagesArray {
            let index = self.imagesArray.indexOf(image)
            let xOrigin = index!*200
            let imageView = UIImageView(frame: CGRect(x: xOrigin, y: 0, width:200, height: 200))
        imageView.image = UIImage(named: image)
        self.imageScrollView.addSubview(imageView)
        
        }
      
        self.imageLabel = UILabel(frame: CGRect(x: 110, y: 250, width: 160, height: 32))
        self.imageLabel.textColor = UIColor.blackColor()
        self.imageLabel.textAlignment = .Center
        self.imageLabel.text = "Tennis"
        self.view.addSubview(imageLabel)
        
        
        let y = self.imageScrollView.frame.origin.y+self.imageScrollView.frame.size.height+60
        
        let btnNext = UIButton(type: .Custom)
        btnNext.autoresizingMask = .FlexibleTopMargin
        btnNext.frame = CGRect(x: 0, y: y, width: 200, height: 44)
        btnNext.center = CGPoint(x: 200, y: btnNext.center.y)
//        btnNext.center = CGPoint(x: 0.5*frame.size.width, y: btnNext.center.y)
        
        btnNext.backgroundColor = UIColor(red:0.25, green: 0.75, blue: 0.5, alpha: 1)
        
        btnNext.layer.borderColor = UIColor.lightGrayColor().CGColor
        btnNext.layer.borderWidth = 1.0
        btnNext.layer.cornerRadius = 5.0
        btnNext.layer.masksToBounds = true
        btnNext.setTitle("Next", forState: .Normal)
        btnNext.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        
        // static let buttonTapped = # selector(#btnN/extAction")
        
        btnNext.addTarget(self, action: #selector (ViewController.btnNextAction(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(btnNext)
        
    }
    
    
    func btnNextAction (btn: UIButton){
        print("btnNextAction")
        
        let forumVc = CTForumViewController()
 
        self.navigationController?.pushViewController(forumVc, animated: true)
    
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView){
        
        self.imageLabel.text = ""
    }

    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView){
        print("scrollViewDidEndDecelerating: \(scrollView.contentOffset.x)")
        
        let offset = scrollView.contentOffset.x
        
        if (offset == 0){
            self.imageLabel.text = "Tennis"
        }
        if (offset == 200){
            self.imageLabel.text = "Soccer"
        }
        if (offset == 400){
            self.imageLabel.text = "Basketball"
        }
        if (offset == 600){
            self.imageLabel.text = "Football"
        }
        if (offset == 800){
            self.imageLabel.text = "Hockey"
        }
    }
    
//    @IBAction func showChatViewController(){
//    print("ShowChatViewController")
//        let chatVc = CTForumViewController()
//        chatVc.title = self.selectedImage.text
//        
//        let selectedSport = self.sportsDict[self.selectedImage.text!]
//        self.navigationController?.pushViewController(chatVc, animated: true)
//    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

