//
//  ViewController.swift
//  Challenge 8: Animation
//
//  Created by Joacim Nidén on 29/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK - vars
    var textColor:UIColor!
    var backgroundColor: UIColor!
    var originalBackgroundColor: UIColor!
    var originalTextColor: UIColor!
    var cornerRadius:CGFloat = 20
    
    
    //MARK - Outlet
    @IBOutlet weak var animateMe: UIButton!
    
    
    //MARK - Action
    @IBAction func animateMe(sender: UIButton) {
        toggleButtonState()
    }
    
    //MARK - Override
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonSettings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK - Functions
    
    func buttonSettings(){
        
        //Set a border radius
        animateMe.layer.cornerRadius = cornerRadius
        
        //Set original colors
        originalBackgroundColor = animateMe.backgroundColor
        originalTextColor = animateMe.currentTitleColor
        
        
        
        
    }
    
    //Toggles the button state
    func toggleButtonState(){
        
        var transform = self.animateMe.transform
        let degrees:CGFloat = 180

        //If empty or the colors are original
        if (textColor == nil || String(textColor) == String(originalTextColor)) {
            textColor = originalBackgroundColor
            backgroundColor = originalTextColor
            
            transform.a = 2.0 //Width, twice as original
            transform = CGAffineTransformRotate(transform,rotate(degrees))
            
           
        }else{
            textColor = originalTextColor
            backgroundColor = originalBackgroundColor
            
            transform = CGAffineTransformIdentity //Reset transformation
        }
        
        //Here's the animation
        UIView.animateWithDuration(0.5, delay: 0, options: .CurveEaseIn, animations: {
            
            self.animateMe.setTitleColor(self.textColor, forState: UIControlState.Normal)
            self.animateMe.backgroundColor = self.backgroundColor
            self.animateMe.layer.borderColor = self.backgroundColor.CGColor
            
            self.animateMe.transform = transform

            
        }, completion: { finished in

            
        });
        
    }
    
    //Rotation function
    func rotate(degrees:CGFloat) -> CGFloat{
        let rotation = CGFloat(M_PI) * degrees / CGFloat(180.0)
        return rotation
    }
    
}

