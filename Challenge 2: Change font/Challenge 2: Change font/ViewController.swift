//
//  ViewController.swift
//  Challenge 2: Change font
//
//  Created by Joacim Nidén on 23/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fontLabel.text = fontList.first
    
    }

    //This will show what font it is
    @IBOutlet weak var fontLabel: UILabel!
    
    //This is where the text box
    @IBOutlet weak var textBox: UITextView!
    
    //Button for changing font
    @IBAction func changeFont(sender: UIButton) {
        
        //To traverse through all fonts, count them all
        let arrayLength = fontList.count
        
        //Start from 0 and restart at the end
        if(currentFont < arrayLength-1){
            currentFont++
        }else{
            currentFont = 0
        }
    
        //this is the font changer
        textBox.font = UIFont (name: fontList[currentFont], size: fontSize)
        
        //Font title
        fontLabel.text = fontList[currentFont]
        
    }
    
    //This is honestly how easy it is to get all available fonts
    var fontList = UIFont.familyNames()
    
    var currentFont = 0 //Font position in array, start from 0
    var fontSize: CGFloat = 14 //default fontSize
    
    

}

