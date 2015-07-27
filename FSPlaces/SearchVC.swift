//
//  ViewController.swift
//  FSPlaces
//
//  Created by mohcine  on 7/26/15.
//  Copyright (c) 2015 mohcine . All rights reserved.
//

import UIKit

class SerachVC: UIViewController,UISearchBarDelegate,UITableViewDataSource,UITableViewDelegate {
    
    //Instance vars
    var searchBar : UISearchBar!
    
    var retriever : Retriever!
    
    //Outlets
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var waitView: UIView!
    
    //methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.retriever = Retriever()
        
        self.title! = "Places"
        
        self.searchBar = UISearchBar(frame: CGRectMake(0, 0, 0.9*self.view.frame.size.width, 50))
        
        self.searchBar.delegate = self
        
        self.searchBar.placeholder = "Search for places Sushi,Pizza..."
        
        self.tableView.tableHeaderView = searchBar
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override  func viewWillAppear(animated: Bool) {
        
        super.viewWillAppear(animated)
        
        
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            
            self.tableView.deselectRowAtIndexPath(indexPath, animated: animated)
            
        }
        
    }
    
    
    //navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "detailSegue" {
            
            let venueDetailVC = segue.destinationViewController as! VenueDetailVC
            
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                
                let currentVenue = self.retriever.book.venuesList[indexPath.row]
                
                venueDetailVC.currentVenue = currentVenue
                
            }
        }
    }
    
    //Search Bar delegate protocols
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        self.retriever.fetchData(self.searchBar.text)
        
        self.searchBar.resignFirstResponder()
        
        self.tableView.reloadData()
    }
    
    //tableView Delegate Protocols
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.searchBar.resignFirstResponder()
    }
    
    //tableView data source protocols
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 70.0
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rowsNumber = self.retriever.book.venuesList.count
        
        if rowsNumber == 0 {
            
            self.tableView.allowsSelection = false
            
            return 1
            
        } else {
            
            self.tableView.allowsSelection = true
            
            return rowsNumber
        }
        
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        
        if self.retriever.book.venuesList.count > 0 {
            
            let venue = self.retriever.book.venuesList[indexPath.row]
            
            cell = tableView.dequeueReusableCellWithIdentifier("searchResultCell", forIndexPath: indexPath) as! UITableViewCell
            
            cell.textLabel?.text = venue.name
            cell.detailTextLabel?.text = "Distance : \(venue.distance)m"
            
            
        } else {
            
            cell = tableView.dequeueReusableCellWithIdentifier("noResultCell", forIndexPath: indexPath) as! UITableViewCell
            
            if self.searchBar.text != "" {
                
                cell.textLabel?.text = "No results for \"\(self.searchBar.text)\" try a different keyword please."
                cell.textLabel?.numberOfLines = 0
                
            } else {
                
                cell.textLabel?.text=""
            }
            
        }
        
        return cell
    }
    
}

