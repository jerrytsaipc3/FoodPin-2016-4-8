//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by Apple on 2016/4/14.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit
import CoreData

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //連結照片庫圖片
    @IBOutlet var imageView:UIImageView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var typeTextField:UITextField!
    @IBOutlet var locationTextField:UITextField!
    @IBOutlet var yesButon:UIButton!
    @IBOutlet var noButton:UIButton!
    
    var isVisited = true
    var restaurant:Restaurant!

    //按save呼叫方法出現提醒
    @IBAction func savebutton(sender: UIBarButtonItem) {
        //定義
          let name = nameTextField.text
          let type = typeTextField.text
          let location = locationTextField.text
        
        //寫程式碼做事
        if name == "" || type == "" || location == "" {
            let alertController = UIAlertController(title: "OOP", message: "We can`t proceed because one of the field is blank.Please note that all field are required.", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
            return
        }
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as?
            AppDelegate)?.managedObjectContext {
            restaurant =
            NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext: managedObjectContext) as! Restaurant
                restaurant.name = name!
                restaurant.type = type!
                restaurant.location = location!
            if let restaurantImage = imageView.image{
            restaurant.image = UIImagePNGRepresentation(restaurantImage)
            }
            restaurant.isVisited = isVisited
            do {
              try managedObjectContext.save()
            } catch {
             print(error)
             return
            }
        }
        
        // Dismiss the view controller
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //YES, NO按鈕轉換顏色
    @IBAction func toggleBeenHereButton(sender: UIButton){
    //Yes 按鈕被點選
        if sender == yesButon {
          isVisited = true
          yesButon.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
          noButton.backgroundColor = UIColor.grayColor()
        }else if sender == noButton {
        isVisited = false
        yesButon.backgroundColor = UIColor.grayColor()
        noButton.backgroundColor = UIColor(red: 235.0/255.0, green: 73.0/255.0, blue: 27.0/255.0, alpha: 1.0)
        }
    }
    
    
    //偵測觸控與載入照片庫
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        if indexPath.row == 0 {
        
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                imagePicker.delegate = self
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //此方法可以取得被選取的照片
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        
        //將回傳圖片利用程式碼控制並做好比例調整
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        leadingConstraint.active = true
        
        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        trailingConstraint.active = true
        
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        topConstraint.active = true
        
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        bottomConstraint.active = true
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
}
   