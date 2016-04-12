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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply a blurring effect to the background image view
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
   
        //animation
        ratingStackView.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        //向上滑動之動畫
        let scale = CGAffineTransformMakeScale(0.0, 0.0)
        let translate = CGAffineTransformMakeTranslation(0, 500)
        ratingStackView.transform = CGAffineTransformConcat(scale, translate)

    }
    
    //加入動畫
    @IBOutlet var ratingStackView:UIStackView!
    
    override func viewDidAppear(animated: Bool) {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: [], animations: {
        self.ratingStackView.transform = CGAffineTransformIdentity
        }, completion: nil)
    }
    

}

