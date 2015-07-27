//
//  Retriever.swift
//  FSPlaces
//
//  Created by mohcine  on 7/26/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import Foundation
import UIKit
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
        
        self.book = VenuesBook()
        
    }
    
    
    func fetchData(query : String) {
        
        //TODO: process query against html
        var queryProcessed = query.stringByFoldingWithOptions(.DiacriticInsensitiveSearch, locale: NSLocale.currentLocale())
        
        self.book.venuesList.removeAll(keepCapacity: false)
        
        let positionString = self.book.myPosition.description()
        
        let stringURL = "https://api.foursquare.com/v2/venues/search?client_id=\(myClientID)&client_secret=\(myClientSecret)&v=20130815&ll=\(positionString)&query=\(queryProcessed)"
        
        var url = NSURL(string: stringURL)
        
        if let serverRawData = NSData(contentsOfURL: url!) {
            
            //serverRawData = JSON Data un serialized
            
            if let serverData: NSDictionary = NSJSONSerialization.JSONObjectWithData(serverRawData, options: NSJSONReadingOptions.MutableContainers, error: nil) as? NSDictionary {
                
                //serverData = JSON Objects -> NSDictionary
                
                //here we are sure that we received data from the server
                
                let response = serverData["response"] as! NSDictionary
                
                let venues  = response["venues"] as! NSArray
                
                //Now that we have an array of venues as NSdictionaries we will transform them to Venue objects and store them into the model
                
                for venue in venues {
                    
                    let venueDic = venue as! NSDictionary
                    
                    let venueObject = Venue(venueDic: venueDic)
                    
                    //println(venueObject.description())
                    
                    self.book.venuesList.append(venueObject)
                    
                    
                    //TODO: sort the results near to  far
                }
            }
            
        } else {
            
            self.showDialog("OOps!", message: "We couldn't laod data please verify your internet connection")
            
        }
        
    }
    
    
    func showDialog(title : String, message : String) {
        
        let alertView = UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: "Ok")
        
    }
    
    
    //location manager delegate protocols
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        let lng = userLocation.coordinate.longitude as Double
        let lat = userLocation.coordinate.latitude  as Double
        
        if lat != 0.0 && lng != 0.0 {
            
            self.book = VenuesBook()
            self.book.myPosition = Position(lat: lat, lng: lng)
            self.locationManager.stopUpdatingLocation()
            
           // println("\(self.book.myPosition.lat),\(self.book.myPosition.lng)")
        }
        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        
        
        self.showDialog("OOps!", message: "We couldn't determine your position, please go to settings and setup the location.")
        
    }
    
}
