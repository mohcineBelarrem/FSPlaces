//
//  VenuesBook.swift
//  FSPlaces
//
//  Created by mohcine  on 7/27/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class VenuesBook {
 
    var venuesList : [Venue]
    var myPosition : Position!
    
    init() {
        
        self.myPosition = Position()
        
        self.venuesList = [Venue]()
    }
    
}
