//
//  ScienceViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class ScienceViewController: UIViewController {
    
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
            exercise = "Animals"
        } else if buttonTag == 1 {
            exercise = "ClassifyAnimals"
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("ScienceLevels") as! ScienceLevelsViewController
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




