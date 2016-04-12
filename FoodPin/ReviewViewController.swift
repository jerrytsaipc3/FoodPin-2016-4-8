//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Apple on 2016/4/11.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    //背景加上模糊特效
    @IBOutlet var backgroundImageView:UIImageView!
    //加入動畫
    @IBOutlet var ratingStackView:UIStackView!
    @IBOutlet var dislikeButton:UIButton!
    @IBOutlet var goodButton:UIButton!
    @IBOutlet var greatButton:UIButton!
    
    
    var rating:String?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply a blurring effect to the background image view
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
   
        
        // Scale down & move the rating stack view off the screen
        // let scale = CGAffineTransformMakeScale(0.0, 0.0)
        // let translate = CGAffineTransformMakeTranslation(0, 500)
        // ratingStackView.transform = CGAffineTransformConcat(scale, translate)
        
        
        //向上滑動之動畫
        let translate = CGAffineTransformMakeTranslation(0, 500)
        dislikeButton.transform = translate
        goodButton.transform = translate
        greatButton.transform = translate

    }
    
    

    
    override func viewDidAppear(animated: Bool) {
        // Spring animation
        UIView.animateWithDuration(0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.dislikeButton.transform = CGAffineTransformIdentity
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.goodButton.transform = CGAffineTransformIdentity
            
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            
            self.greatButton.transform = CGAffineTransformIdentity
            
            }, completion: nil)
        // Normal animation
        //        UIView.animateWithDuration(0.7, delay: 0.0, options: [], animations: {
        //            self.ratingStackView.transform = CGAffineTransformIdentity
        //        }, completion: nil)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

        //將評價圖回傳至DetailView
    @IBAction func ratingSelected(sender: UIButton){
        switch(sender.tag){
        case 100: rating = "dislike"
        case 200: rating = "good"
        case 300: rating = "great"
        default: break
        }
        performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }
   }

