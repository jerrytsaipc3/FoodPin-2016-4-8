//
//  Restaurant.swift
//  FoodPin
//
//  Created by Simon Ng on 20/8/15.
//  Copyright © 2015 AppCoda. All rights reserved.
//

import Foundation
import CoreData

class Restaurant:NSManagedObject {
    @NSManaged var name:String
    @NSManaged var type:String
    @NSManaged var location:String
    @NSManaged var image:NSData?
    @NSManaged var phone:String?
    @NSManaged var rating:String?
    @NSManaged var isVisited:NSNumber?

    
    
    /*init(name:String, type:String, location:String, image:String, phone:String, isVisited:Bool) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.phone = phone
        self.isVisited = isVisited }
      */
    
}

