//
//  Country.swift
//  Challenge 23
//
//  Created by Joacim Nidén on 04/04/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation
import UIKit

struct Country {
    enum Continent {
        case Africa
        case America
        case Europe
        case Asia
        case Oceania
        
        func toString() -> String {
            switch self {
            case .Africa:
                return "Africa"
            case .America:
                return "America"
            case .Europe:
                return "Europe"
            case .Asia:
                return "Asia"
            case .Oceania:
                return "Oceania"
                
            }
        }
        
        func toColor() -> UIColor {
            switch self {
            case .Africa:
                return UIColor.redColor()
            case .America:
                return UIColor.blueColor()
            case .Europe:
                return UIColor.blackColor()
            case .Asia:
                return UIColor.purpleColor()
            case .Oceania:
                return UIColor.greenColor()
                
            }
        }
    }
    
    let continent: Continent
    let summary: String
}
