//
//  Concert.swift
//  Challenge 17
//
//  Created by Joacim Nidén on 10/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class Concert{
    
    var title = "";
    var description = "";
    var featuredImage: UIImage!
    
    init(title:String,description: String, featuredImage: UIImage!){
        self.title = title
        self.description = description
        self.featuredImage = featuredImage
    }
    
    static func createConcerts() -> [Concert]{
        
        
        return [
            Concert(title: "Parkway Drive", description: "metalcore", featuredImage: UIImage(named: "IMG_0484")!),
            Concert(title: "Parkway Drive as well", description: "metalcore", featuredImage: UIImage(named: "IMG_0485")!),
            Concert(title: "Another band", description: "metalcore", featuredImage: UIImage(named: "IMG_0489")!),
            Concert(title: "Another band", description: "metalcore", featuredImage: UIImage(named: "IMG_0490")!),
            Concert(title: "Another band", description: "metalcore", featuredImage: UIImage(named: "IMG_0515")!)
        ]
    }
    
    
}
