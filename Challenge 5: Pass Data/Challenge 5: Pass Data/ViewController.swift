//
//  ViewController.swift
//  Challenge 5: Pass Data
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var textArea: UITextView!
   
   //The segue function, connection between views
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        //Only connect to a certain Segue
        if (segue.identifier == "segueToSecond") {
            let svc = segue.destinationViewController as! SecondViewController;
            
            //Here is the message scent
            svc.message = textArea.text
            
            
        }
    }

}

