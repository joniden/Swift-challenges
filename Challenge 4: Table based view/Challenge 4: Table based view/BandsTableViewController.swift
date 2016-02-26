//
//  FruitsTableViewController.swift
//  Challenge 4: Table based view
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class BandsTableViewController: UITableViewController {
    
    var data = ["Blink 182","30 seconds to mars","A day to remember","Slipknot","Anberlin","Silverstein","State Champs","Sum 41","System of a Down"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.editing = true //Enables editing
    }


    // MARK: - Table view data source

    //Number of sections (really not necessary if only 1)
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
       
        return 1
    }

    //Number of rows (as long as the array)
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //Fills the cell with values, the cell is BandCell, named in Xcode
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("BandCell", forIndexPath: indexPath)
        
        cell.textLabel?.text = data[indexPath.row]
        return cell
    }
    
    //Hide the delete controls (enabled by the the tableview editing = true)
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        return .None
    }
    
    //Same as above
    override func tableView(tableView: UITableView, shouldIndentWhileEditingRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    //Enables movement of rows
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let movedObject = self.data[sourceIndexPath.row]
        data.removeAtIndex(sourceIndexPath.row)
        data.insert(movedObject, atIndex: destinationIndexPath.row)
    }


}
