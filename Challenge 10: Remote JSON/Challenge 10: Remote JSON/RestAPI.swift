//
//  RestAPI.swift
//  Challenge 10: Remote JSON
//
//  Created by Joacim Nidén on 02/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import Foundation

class RestAPI {
    
    var bytes: NSMutableData?
    let urlPath:String = "http://moshpitandcode.com/gigs/bands/1?json" //The url we're getting
    let errorDomain = "moshpitandcode"
    
    func asyncCall(completion: (jsonData: NSDictionary?, error: NSError?)->Void){
        
        //The data that we store, jsonData, will be a dictionary because of key & value
        var jsonData: NSDictionary?
        let errorTitle = "Error"
        
        //Create a NSURLobject
        let url = NSURL(string: urlPath)
        let request = NSMutableURLRequest(URL: url!) //Request
        
        //NSURLSession is for downloading content, opens a singleton connection
        let session = NSURLSession.sharedSession()
        
        //Start the task
        let task = session.dataTaskWithRequest(request) {urlData, response, reponseError in
            
            //Check that urlData is not empty
            if let receivedData = urlData {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
            
                if 200..<300 ~= res.statusCode {
                    do {
                        jsonData = try NSJSONSerialization.JSONObjectWithData(receivedData, options: []) as? NSDictionary
                        //On success, invoke `completion` with passing jsonData.
                        completion(jsonData: jsonData, error: nil)
                    } catch let error as NSError {
                        let returnedError = NSError(domain: self.errorDomain, code: 3, userInfo: [
                            "title": errorTitle,
                            "message": "Invalid data",
                            "cause": error
                        ])
                        //On error, invoke `completion` with NSError.
                        completion(jsonData: nil, error: returnedError)
                    }
                }else {
                    let returnedError = NSError(domain: self.errorDomain, code: 1, userInfo: [
                        "title": errorTitle,
                        "message": "Connection fail"
                    ])
                    //On error, invoke `completion` with NSError.
                    completion(jsonData: nil, error: returnedError)
                }
            }else {
                var userInfo: [NSObject: AnyObject] = [
                    "title": errorTitle,
                    "message": "Connection fail"
                ]
                if let error = reponseError {
                    userInfo["message"] = error.localizedDescription
                    userInfo["cause"] = error
                }
                let returnedError = NSError(domain: self.errorDomain, code: 2, userInfo: userInfo)
                //On error, invoke `completion` with NSError.
                completion(jsonData: nil, error: returnedError)
            }
        }
        task.resume()
        
    }
    
    /**
     * Test function to try the code
     * This will just run the function
     */
    func call() {
        
        //jsonData will contain the returned data
        asyncCall() {jsonData, error in
            if let json = jsonData {
                //Process json as an NSArray
                print(json)
            } else {
                print("No json")
            }
        }
    }
    
    
    
}