//
//  MathViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class MathViewController: UIViewController {
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var audioPlayerSound = AVAudioPlayer()
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func exerciseButtons(sender: KPButton) {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        
        let buttonTag = sender.tag
        var exercise = ""
        
        if buttonTag == 0 {
            exercise = "Calculator"
        } else if buttonTag == 1 {
            exercise = "counting"
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("MathLevels") as! MathLevelsViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        storyBoardLevels.exercise = exercise
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }

    @IBAction func backToMainViewController() {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
