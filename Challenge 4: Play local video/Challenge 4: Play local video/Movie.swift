//
//  Movie.swift
//  Challenge 4: Play local video
//
//  Created by Joacim Nidén on 25/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    var name: String
    var photo: UIImage?
    
    init?(name: String, photo: UIImage?){
        self.name = name
        self.photo = photo
        
        if name.isEmpty {
            return nil
        }
    }
    
}
