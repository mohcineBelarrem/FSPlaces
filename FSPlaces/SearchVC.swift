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
    
    
    //Outlets
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var waitView: UIView!
    
    //methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title! = "Places"
        
        self.searchBar = UISearchBar(frame: CGRectMake(0, 0, 0.9*self.view.frame.size.width, 50))
        
        self.searchBar.delegate = self
        
        self.searchBar.placeholder = "Search for places nearby Sushi,Pizza"
        
        self.tableView.tableHeaderView = searchBar
        
       // self.tableView.hidden = true
        
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
        
        println("here we go")
        
    }
    
    //Search Bar delegate protocols
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
    
    //tableView Delegate Protocols
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.searchBar.resignFirstResponder()
    }
    
    //tableView data source protocols
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 50.0
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("searchResultCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = "Hello"
        cell.detailTextLabel?.text = "World"
        
        return cell
    }
    
}

