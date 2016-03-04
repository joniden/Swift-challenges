//
//  Content.swift
//  Challenge 12: Collection and table view
//
//  Created by Joacim Nidén on 04/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation

class Content {
    
    
    func result(fileName: String) -> NSData{
        
        let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json")
        let jsonData = NSData(contentsOfMappedFile: path!)
        
        return jsonData!
    }
    
}
