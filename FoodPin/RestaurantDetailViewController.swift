//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 19/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource,
      UITableViewDelegate {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantDetailTableViewCell
        
        //set cell backgroundcolor, let background become transparent
        cell.backgroundColor = UIColor.clearColor()
        
        //SET CELL
        switch indexPath.row{
        
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = restaurant.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = restaurant.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = restaurant.location
        case 3:
            cell.fieldLabel.text = "Phone"
            cell.valueLabel.text = restaurant.phone
        case 4:
            cell.fieldLabel.text = "Been here"
            if let isVisited = restaurant.isVisited?.boolValue {cell.valueLabel.text = isVisited ? "Yes, I`ve been here before" : "No"
            }
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
            
        }
        return cell
        
    }
    
    @IBOutlet var restaurantImageView:UIImageView!
    
    var restaurant:Restaurant!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set background color
        restaurantImageView.image = UIImage(data: restaurant.image!)
        tableView.backgroundColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha:0.2)
        
        //cut surplus cell line
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        //set line color
        tableView.separatorColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue:240.0/255.0, alpha:
            0.8)
        
        //title = restaurant name
        title = restaurant.name
        
        //設定cell自動配合文字多寡調整高度
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        // Set the rating of the restaurant
        if let rating = restaurant.rating where rating != "" {
            ratingButton.setImage(UIImage(named: restaurant.rating!), forState: UIControlState.Normal)
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBOutlet var tableView:UITableView!
    @IBOutlet var ratingButton:UIButton!
    
    //hide navigationbar in restaurantDetailView but appear on restaurantView
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    //視圖取消回復，並回傳圖案回DetailView
    @IBAction func close(segue:UIStoryboardSegue) {
        if let reviewViewController = segue.sourceViewController as? ReviewViewController {
            if let rating = reviewViewController.rating {
                restaurant.rating = rating
                ratingButton.setImage(UIImage(named: rating), forState: UIControlState.Normal)
                
                //儲存評價至資料庫
                if let managedObjectedContext = (UIApplication.sharedApplication().delegate as?
                    AppDelegate)?.managedObjectContext {
                    do {
                    try managedObjectedContext.save()
                    } catch {
                      print(error)
                    }
                }
            }
        }
    }
    //將選取地圖傳到視圖控制器
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showMap" {
        let destinationController = segue.destinationViewController as!
            MapViewController
              destinationController.restaurant = restaurant
        }
    }
    
}
