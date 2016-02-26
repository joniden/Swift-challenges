//
//  ViewController.swift
//  Calculator
//
//  Created by Joacim Nidén on 13/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var userIsInTheMiddleOfTypingNumber = false

    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsInTheMiddleOfTypingNumber {
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsInTheMiddleOfTypingNumber = true
        }
        
    }
    
    var brain = CalculatorBrain()
    
    @IBAction func operate(sender: UIButton) {
        
        if (userIsInTheMiddleOfTypingNumber){
            enter()
        }
        
        if let operation = sender.currentTitle{
            if let result = brain.performOperation(operation) {
                displayValue = result
            }else{
                displayValue = 0
            }
        }
        

    }
    
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingNumber = false
        if let result = brain.pushOperand(displayValue) {
            displayValue = result
        }else{
            displayValue = 0
        }
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingNumber = false
        }
    }
}

