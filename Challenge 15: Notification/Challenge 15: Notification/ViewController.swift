//
//  ViewController.swift
//  Challenge 15: Notification
//
//  Created by Joacim Nidén on 08/03/16.
//  Copyright © 2016 Joacim Nidén. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var textField: UITextField!

    @IBAction func showAsNotification(sender: UIButton) {
        
        let fireDate:NSDate = NSDate(timeIntervalSinceNow: 5)
        let notificationMessage = textField!.text
        
        let notification = UILocalNotification()
        notification.alertBody = notificationMessage // text that will be displayed in the notification
        notification.fireDate = fireDate // todo item due date (when notification will be fired)
        notification.soundName = UILocalNotificationDefaultSoundName // play default sound
        notification.applicationIconBadgeNumber = 1

        UIApplication.sharedApplication().scheduleLocalNotification(notification)
        
    }
}

