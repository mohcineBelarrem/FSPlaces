//
//  VenueDetailVC.swift
//  FSPlaces
//
//  Created by mohcine  on 7/26/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class VenueDetailVC: UITableViewController {
    
    //Instance vars
    var currentVenue : Venue!
    
    var currentVenueArray = [String]()
    
    //mtehods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.title = self.currentVenue.name
        
        self.currentVenueArray.append(self.currentVenue.name)
        self.currentVenueArray.append("\(self.currentVenue.distance)m")
        self.currentVenueArray.append(self.currentVenue.address)
        
        //println(self.currentVenue.address)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 4
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.section == 3 {
            
            return self.view.frame.height
            
        } else if indexPath.section == 2 {
            
            return 90.0
            
        } else {
            
            return 44.0
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell : UITableViewCell!
        
        if indexPath.section == 3 {
            
            cell = tableView.dequeueReusableCellWithIdentifier("detailMapCell", forIndexPath: indexPath) as! UITableViewCell
            
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier("detailNormalCell", forIndexPath: indexPath) as! UITableViewCell
            
            cell.textLabel?.text = self.currentVenueArray[indexPath.section]
            cell.textLabel?.numberOfLines = 0
            
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        //configuring the different headers titles of the tableView
        
        var headerTitle = ""
        
        switch section {
            
        case 0 :
            headerTitle = "Name"
        case 1 :
            headerTitle = "Distance"
        case 2 :
            headerTitle = "Address"
        case 3 :
            headerTitle = "Map"
            
        default:
            
            headerTitle = ""
        }
        
        return headerTitle
    }
    
    
    
}
