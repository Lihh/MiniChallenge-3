//
//  PortugueseViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class PortugueseViewController: UIViewController {
    
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
        var gameName = ""
        
        if buttonTag == 0 {
            exercise = "gameSyllables"
            gameName = "Forme a Palavra"
        } else if buttonTag == 1 {
            exercise = "completeTheWord"
            gameName = "Complete a Palavra"
        }
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("PortugueseLevels") as! PortugueseLevelsViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        storyBoardLevels.exercise = exercise
        storyBoardLevels.gameName = gameName
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
