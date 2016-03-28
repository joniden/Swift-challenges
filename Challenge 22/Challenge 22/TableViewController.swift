//
//  TableViewController.swift
//  Challenge 22
//
//  Created by Joacim Nidén on 28/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit
import SwiftyJSON

class TableViewController: UITableViewController {
    
    let api = RemoteAPI()
    var bands = [Band]()
    
    //These are the most important
    let searchController = UISearchController(searchResultsController: nil)
    var filteredBands = [Band]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SearchController
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        api.urlPath = "https://moshpitandcode.com/gigs/bands/all?json"
        
        dispatch_async(dispatch_get_main_queue(), {
            self.api.getData() { responseObject, error in
                
                guard let jsonData = JSON(rawValue: responseObject!["bands"]!) else{
                    print("not able to download")
                    return 
                }
                
                for (_,row) in jsonData{
                    self.bands.append(Band(json:row))
                }
                
                self.tableView.reloadData()
                
            }
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //Don't count bands if filter is active
        if searchController.active && searchController.searchBar.text != "" {
            return filteredBands.count
        }
        
        return self.bands.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let band:Band
        
        if searchController.active && searchController.searchBar.text != "" {
            band = filteredBands[indexPath.row]
        }else{
            band = self.bands[indexPath.row]
        }
        
        cell.textLabel?.text = band.name
        
        
        return cell
    }
    
    //This is the function that will filter all
    func filterContentForSearchText(searchText: String, scope: String = "All") {
        filteredBands = bands.filter { band in
            return band.name.lowercaseString.containsString(searchText.lowercaseString)
        }
        
        tableView.reloadData()
    }
    
    
    
}

extension TableViewController: UISearchResultsUpdating {
    
    //This is the most important one, otherwise it won't do anything
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text!)
    }
}
