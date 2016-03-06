//
//  ViewController.swift
//  Challenge 14
//
//  Created by Joacim Nidén on 06/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadlocalHTML("index")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var webView: UIWebView!
    
    @IBAction func segment(sender: UISegmentedControl) {

        
        switch sender.selectedSegmentIndex {
            
        case 0 :
            loadlocalHTML("index")
     
            
        case 1 :
            loadRemotePage("http://moshpitandcode.com")

            
        default:
            break
            
        }
        
        
    }
    
    
    //MARK: Functions
    func loadlocalHTML(file: String){
        let filePath = NSBundle.mainBundle().URLForResource(file, withExtension: "html")
        
        let request = NSURLRequest(URL: filePath!)
        
        webView.loadRequest(request)
    }
    
    func loadRemotePage(url: String){
        let urlObject = NSURL (string: url)
        
        let request = NSURLRequest(URL: urlObject!)
        
        webView.loadRequest(request)
        
        
    }
    
    //http://sourcefreeze.com/uiwebview-example-using-swift-in-ios/
}

