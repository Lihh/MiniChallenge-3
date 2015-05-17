//
//  ScienceViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ScienceViewController: UIViewController {
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func exerciseButtons(sender: KPButton) {
        let exercise = sender.currentTitle!
        let dictionary = ["Exercise" : exercise]
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("ScienceLevels") as! UIViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        presentViewController(storyBoardLevels, animated: true) { () -> Void in
            self.notificationCenter.postNotificationName("ScienceExercise", object: self, userInfo: dictionary)
        }
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}




