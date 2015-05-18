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
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("ScienceLevels") as! ScienceLevelsViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        storyBoardLevels.exercise = exercise
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}




