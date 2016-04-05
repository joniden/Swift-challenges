//
//  ViewController.swift
//  Challenge 23
//
//  Created by Joacim Nidén on 04/04/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let countries = [
        Country(continent: .Asia, summary: "China"),
        Country(continent: .Africa, summary: "South Africa"),
        Country(continent: .Asia, summary: "India"),
        Country(continent: .Europe, summary: "Sweden"),
        Country(continent: .Oceania, summary: "Australia"),
        Country(continent: .America, summary: "Canada"),
        Country(continent: .Europe, summary: "Germany"),
        Country(continent: .Africa, summary: "Egypt"),
        Country(continent: .America, summary: "Brazil"),
    ]
    
    private let TableHeaderHeight: CGFloat = 300.0
    var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the headerview to being dynamic
        headerView = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerView)
        
        //Push the content down
        tableView.contentInset = UIEdgeInsets(top: TableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -TableHeaderHeight) //Sets the starting position at the top
        
        updateHeaderView()
        
        
    }

    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CountryCell
        
        cell.country = countries[indexPath.row]
        
        return cell
    }
    
    //Update the picture
    func updateHeaderView(){
        
        //Creates a new rectangle
        var headerRect = CGRect(x: 0, y: -TableHeaderHeight, width: tableView.bounds.width, height: TableHeaderHeight)
        
        //If you've scrolled so far up that the y-value is smaller the height of the table header
        if tableView.contentOffset.y < -TableHeaderHeight {
            
            //Change the size of the image so it will cover the top
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height =  -tableView.contentOffset.y
            
        }
        
        headerView.frame = headerRect
    }


}

