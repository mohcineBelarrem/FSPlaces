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
        
        self.lat = (location["lat"] as! NSNumber).doubleValue
        self.lng = (location["lng"] as! NSNumber).doubleValue
        
    }
    
    init(lat : Double = 0.0, lng : Double = 0.0) {
        
        self.lat = lat
        self.lng = lng
    }
    
    func description() -> String {
        
        return "\(self.lat),\(self.lng)"
    }
}


class Venue {
    
    
    var name      : String 
    var distance  : Int32
    var position  : Position
    var address   : NSArray
    
    init() {
        
        self.name = ""
        self.distance = 0
        self.position = Position()
        self.address = NSArray()
        
        //TODO:add code to print distance m or km
    }
    
    init(venueDic : NSDictionary) {
        
        self.name = venueDic["name"] as! String
        
        let venuDicLocation = venueDic["location"] as! NSDictionary
        
        self.distance = (venuDicLocation["distance"] as! NSNumber).intValue
        
        self.position = Position(location : venuDicLocation)
        
        self.address = venuDicLocation["formattedAddress"] as! NSArray
        
    }
    
    
     func description () -> String {
        
        return self.name + " \(self.distance) \(self.position.lat) \(self.position.lng) \(self.address)"
    }

}
