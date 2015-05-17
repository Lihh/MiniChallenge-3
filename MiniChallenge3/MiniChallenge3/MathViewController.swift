//
//  MathViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exerciseButtons(sender: KPButton) {
        let exercise = sender.currentTitle!
        let dictionary = ["Exercise" : exercise]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("MathLevels") as! UIViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(storyBoardLevels, animated: true) { () -> Void in
            self.notificationCenter.postNotificationName("Exercise", object: self, userInfo: dictionary)
        }
    }

    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
