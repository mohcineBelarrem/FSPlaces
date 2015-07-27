//
//  Venue.swift
//  FSPlaces
//
//  Created by mohcine  on 7/26/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit


struct Position {
    
    var lat       : Double
    var lng       : Double
   
     init(location : NSDictionary) {
        
        self.lat = (location["lat"] as! NSString).doubleValue
        self.lng = (location["lng"] as! NSString).doubleValue
        
    }
    
    init(lat : Double, lng : Double) {
        
        self.lat = lat
        self.lng = lng
    }
    
}


class Venue {
    
    
    var name      : String
    var distance  : Int
    var position  : Position
    var address   : NSArray
    
    init(venueDic : NSDictionary) {
        
        self.name = venueDic["name"] as! String
        
        let venuDicLocation = venueDic["location"] as! NSDictionary
        
        self.distance = (venuDicLocation["distance"] as! String).toInt()!
        
        self.position = Position(location : venuDicLocation)
        
        self.address = venuDicLocation["formattedAddress"] as! NSArray
        
    }
    
    
     func description () -> String {
        
        return self.name + " \(self.distance) \(self.position.lat) \(self.position.lng) \(self.address)"
    }

}
