//
//  Pin.swift
//  Challenge 6: Location
//
//  Created by Joacim Nidén on 27/02/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation
import MapKit

class Pin: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String,  coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        super.init()
    }
}
