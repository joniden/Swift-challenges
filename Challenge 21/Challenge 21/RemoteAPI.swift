//
//  RemoteAPI.swift
//  Challenge 21
//
//  Created by Joacim Nidén on 27/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RemoteAPI{
    var urlPath:String = ""
    
    //Remote connect
    func getData(completionHandler: (NSDictionary?, NSError?) -> ()){
        Alamofire.request(.GET, self.urlPath).responseJSON { response in
            
            switch response.result {
            case .Success(let value):
                completionHandler(value as? NSDictionary, nil)
            case .Failure(let error):
                completionHandler(nil, error)
            }
        }
    }

}
