//
//  AddRestaurantController.swift
//  FoodPin
//
//  Created by Apple on 2016/4/14.
//  Copyright © 2016年 AppCoda. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController {
    
    //偵測觸控與載入照片庫
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        if indexPath.row == 0 {
        
            if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

}
