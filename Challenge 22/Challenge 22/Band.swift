//
//  Band.swift
//  Challenge 22
//
//  Created by Joacim Nidén on 28/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Band{
    
    var id:Int
    var name: String
    var created_at: String
    var updated_at: String
    var lastShow: String
    var count: Int
    
    init(json:JSON){
        
        let band = json
        
        self.id = band["id"].intValue
        self.name = band["name"].stringValue
        self.created_at = createDate(band["created_at"].stringValue)
        self.updated_at = createDate(band["updated_at"].stringValue)
        self.lastShow = createDate(band["gigs"][0]["from_date"].stringValue)
        self.count = band["gigs"].count
        
    }
    
    
}

func createDate(date:String) -> String{
    
    let dateFormatter = NSDateFormatter()
    
    if date != ""{
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateObject = dateFormatter.dateFromString(date)
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let newDate = dateFormatter.stringFromDate(dateObject!)
        
        return newDate
    }else{
        
        let date = NSDate()
        let dateString = dateFormatter.stringFromDate(date)
        return dateString
    }
    
    
}

