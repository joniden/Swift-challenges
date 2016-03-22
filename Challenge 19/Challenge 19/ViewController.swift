//
//  ViewController.swift
//  Challenge 19
//
//  Created by Joacim Nidén on 22/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlet
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var text: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.text.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 1.0, initialSpringVelocity: 3.0, options: .CurveEaseOut, animations: {
            
            var logoframe = self.logo.frame
            
            logoframe.size.height = logoframe.height*0.9
            logoframe.size.width = logoframe.width*0.9
            
            logoframe.origin.y = 30
            
            //Place it in absolute center
            logoframe.origin.x = (self.view.frame.width - logoframe.width)/2
            
            self.logo.frame = logoframe
            self.text.alpha = 1.0
            
            }, completion: { finished in
            
        })
    }


}

