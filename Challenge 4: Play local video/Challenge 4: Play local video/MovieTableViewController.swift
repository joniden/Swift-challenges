//
//  MovieTableViewController.swift
//  Challenge 4: Play local video
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMovies()
    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return movies.count
    }
    
    //MARK: -Properties
    var movies = [Movie]()
    
    func loadSampleMovies() {
        let photo = UIImage(named: "controlcentre")!
        let movie = Movie(name: "Control Centre", photo: photo)!
        
        movies += [movie]
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "MovieTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.movieTitle.text = movie.name
        cell.printScreen.image = movie.photo
        
        return cell
    }

}
