//
//  Retriever.swift
//  FSPlaces
//
//  Created by mohcine  on 7/26/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import Foundation
import CoreLocation

class Retriever : NSObject , CLLocationManagerDelegate  {
    
    //Instance vars
    
    let locationManager = CLLocationManager()
    
    var book : VenuesBook!
    
    //methods
    
    override init() {
        
        super.init()
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
       
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        let lng = userLocation.coordinate.longitude as Double
        let lat = userLocation.coordinate.latitude  as Double
        
        if lat != 0.0 && lng != 0.0 {
           
            self.book = VenuesBook(lat: lat, lng: lng)
            self.locationManager.stopUpdatingLocation()
            
            println("\(self.book.myPosition.lat),\(self.book.myPosition.lng)")
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        println("Error: " + error.localizedDescription)
        
    }

}
