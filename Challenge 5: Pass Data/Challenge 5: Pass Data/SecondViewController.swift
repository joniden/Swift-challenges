//
//  SecondViewController.swift
//  Challenge 5: Pass Data
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    //The passing string
    var message: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set the text
        textFromPage1.text = message

    }

    
    @IBOutlet weak var textFromPage1: UILabel!
    
    

}
