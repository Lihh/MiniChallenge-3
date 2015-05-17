//
//  PortugueseLevelsViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class PortugueseLevelsViewController: UIViewController {
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var exercise = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        notificationCenter.addObserver(self, selector: Selector("discoverExercise:"), name: "PortugueseExercise", object: nil)
    }

    func discoverExercise(notification: NSNotification) {
        exercise = notification.userInfo!["Exercise"] as! String
    }
    
    @IBAction func transitionToLevel(sender: KPButton) {
        let buttonTitle: AnyObject = sender.currentTitle!
        let exerciseStoryboard = UIStoryboard(name: exercise, bundle: nil)
        
        if let viewController = exerciseStoryboard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            presentViewController(viewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
