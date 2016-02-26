//
//  DataTableViewController.swift
//  Challenge 4: Table based view
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class DataTableViewController: UITableViewController {

    
    //How many sections
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 3
    }

    //Rows in each section
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    //Fill the cells
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //LabelCell is an identifier named in Xcode
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)
     
        cell.textLabel?.text = "Row \(indexPath.row)"

        return cell
    }
    
    //Section titles
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
}
