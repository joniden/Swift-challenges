//
//  ViewController.swift
//  Startstop
//
//  Created by Joacim Nidén on 22/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var counter = 0.0 // This will create a float
    var active = false //Set a variable if active or not
    var timer = NSTimer() //We need a timer

    //This is the label (0)
    @IBOutlet weak var timerLabel: UILabel!

    //Play button
    @IBAction func play(sender: UIButton) {
        
        //This is a toggle
        if active == false {
            
            //Set it as active
            active = true
            
            /* 
            This is how it looks like when setting a timer
            0.1 is how fast it updates
            timerAction is the callback to trigger every 0.1 seconds
            */
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "timerAction", userInfo: nil, repeats: true)
            
            
            
            //Change title from play to pause
            sender.setTitle("Pause", forState: .Normal)
            
        }else{
            //This is when pausing
            active = false
            timer.invalidate() //The actual pause
            sender.setTitle("Play", forState: .Normal) //Change title to play
        }
        
        

    }

    //This used to be a pause, but I changed it to a reset
    @IBAction func pause(sender: UIButton) {
        timer.invalidate()
        active = false
        counter = 0.0 //The reset value
        timerLabel.text = "\(counter)" //converts float to string
        
        
    }
    
    //This will increase the counter and change the label
    func timerAction(){
        counter+=0.1
        timerLabel.text = "\(counter)"
        
    }
    
    
}

