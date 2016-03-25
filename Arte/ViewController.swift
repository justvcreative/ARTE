//
//  ViewController.swift
//  Arte
//
//  Created by Veronica on 3/18/16.
//  Copyright © 2016 JustVCreative. All rights reserved.
//

import UIKit
import Social

class ViewController:  UIViewController {
   
    @IBOutlet weak var successLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        successLabel.hidden = true
    }

    @IBAction func TweetAction(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            print("account yes")
            let tweetController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            tweetController.setInitialText("Check out @Th3Ba1r0n's artwork on #ARTE App")
            tweetController.completionHandler = {
                (result: SLComposeViewControllerResult) -> Void in
                switch result {
                    case SLComposeViewControllerResult.Cancelled:
                        print("cancelled")
                    case SLComposeViewControllerResult.Done:
                        print("tweet successful")
                       self.successLabel.hidden = false
                }
            }
            self.presentViewController(tweetController, animated: true, completion: nil)
        } else {
            print("account no")
            let alert =  UIAlertController(title: "Accounts", message: "Please Log In To Your Twitter Account", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.Default, handler: {
                (UIAlertAction) in
                let settingsURL = NSURL(string: UIApplicationOpenSettingsURLString)
                if let url = settingsURL {
                    UIApplication.sharedApplication().openURL(url)
                }
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}