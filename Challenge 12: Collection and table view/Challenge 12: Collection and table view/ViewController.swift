//
//  ViewController.swift
//  Challenge 12: Collection and table view
//
//  Created by Joacim Nidén on 04/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        modalTransitionStyle = .CrossDissolve
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
       
        
    }
    
    //MARK: IBActions
    @IBAction func segmentedControl(sender: UISegmentedControl) {
        
    }
    
    
    //MARK: Functions
    func segTitle(segment: UISegmentedControl) -> String{
        return segment.titleForSegmentAtIndex(segment.selectedSegmentIndex)!
    }
    
    
    
    
    
    

}

