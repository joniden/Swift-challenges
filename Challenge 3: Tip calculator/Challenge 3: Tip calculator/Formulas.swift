//
//  Formulas.swift
//  Challenge 3: Tip calculator
//
//  Created by Joacim Nidén on 24/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation

class Formulas {
    
    
    func calculateTip(tip:Float, price:Float) -> Float{
        
        var totalCost:Float = 0.0
        let calculatorPrice:Float = price
        let calculatorTip:Float = tip
        
        if tip > 0 {
            totalCost = calculatorPrice*((calculatorTip/100.0)+1.0)
        }else{
            totalCost = calculatorPrice
        }
        
        return totalCost
        
    }
    
}
