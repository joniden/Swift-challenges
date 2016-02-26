//
//  ViewController.swift
//  Challenge 3: Tip calculator
//
//  Created by Joacim Nidén on 24/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }

    //Set global variables
    var priceVar:Float = 0.0
    var stepSnap:Float = 5
    var tipVar:Float = 0.0
    let Form = Formulas()
    
    @IBAction func price(sender: UITextField) {
        
        let priceInput = sender.text
        
        //Prevent error when deleting
        if priceInput == "" {
            priceVar = 0.0
        }else{
            priceVar = Float(priceInput!)!
        }
        
        let totalCost = Form.calculateTip(tipVar, price: priceVar)
        
        totalLabel.text = String(format: "Total: %d kr", Int(totalCost))
       
    }
    
    

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func tipSlider(sender: UISlider) {
        
        let tip:Float = stepSnap * floor((sender.value/stepSnap)+(stepSnap/10));
        tipVar = tip
        
        sender.setValue(tip, animated: true)
        
        let totalCost = Form.calculateTip(tip, price: priceVar)

        totalLabel.text = String(format: "Total: %d kr", Int(totalCost))
        tipLabel.text = String(format: "Tip: %d %%", Int(tip))
        
        
    }
    
   
    
}

