//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class GameAnimalsViewController: UIViewController {

    // MARK: - Properties and Outlets
    //================================================================================
    @IBOutlet weak var tutorialHand: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imgScore: UIImageView!
    
    @IBOutlet weak var btn1: KPButton!
    @IBOutlet weak var btn2: KPButton!
    @IBOutlet weak var btn3: KPButton!
    @IBOutlet weak var btn4: KPButton!
    @IBOutlet weak var btn5: KPButton!
    @IBOutlet weak var btn6: KPButton!
    
    @IBOutlet weak var answerLabel: UILabel!

    // Game Level and Lifes
    var level = 0
    var lifes = 3
    
    // Notification Center
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
    //Singletons
    let persistence = Persistence.sharedInstance
    let animals = AnimalsModel.sharedInstance
    //================================================================================
    
    var audioPlayerSound = AVAudioPlayer()
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)

    
    // MARK: - VC Life Cycle
    //================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: Selector("getLvl:"), name: "CurrentLevelScienceExercise", object: nil)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        // Show Tutorial
        if level == 0
        {
            tutorialHand.hidden = false
            disableButtons()
            UIView.showTutorial(self.view, hand: tutorialHand, destiny1: answerLabel, x1: -70, y1: 50, destiny2: btn3, x2: 60, y2: 240)
        }
    }
    //================================================================================

    
    // MARK: - Game Configuration
    //================================================================================
    func getLvl(notification: NSNotification) {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        gameConfiguration()
        buttonsConfiguration()
        
    }
    
    func gameConfiguration() {
        // Score
        UIView.setImageInImageView(imgScore, imageName: "ThreeStarsFilled")
        
        //Label
        UIView.setTextInLabel(answerLabel, labelText: animals.levels[level].labelText)
        
        //Img
        UIView.setImageInImageView(imageView, imageName: animals.levels[level].nameAnimal)
    }
    
    func buttonsConfiguration() {
        
        tutorialHand.hidden = true
        UIView.setTextInButton(btn1, buttonText: animals.levels[level].button1Text)
        UIView.setTextInButton(btn2, buttonText: animals.levels[level].button2Text)
        UIView.setTextInButton(btn3, buttonText: animals.levels[level].button3Text)
        UIView.setTextInButton(btn4, buttonText: animals.levels[level].button4Text)
        UIView.setTextInButton(btn5, buttonText: animals.levels[level].button5Text)
        UIView.setTextInButton(btn6, buttonText: animals.levels[level].button6Text)
    }
    //================================================================================

    
    
    // MARK: - Button Click
    //================================================================================
    @IBAction func btnClicked(sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            if animals.levels[level].button1Correct == true
            {
                rightAnswer(btn1)
            }
            else
            {
                wrongAnswer(btn1)
            }
            
        case 2:
            if animals.levels[level].button2Correct == true
            {
                rightAnswer(btn2)
            }
            else
            {
                wrongAnswer(btn2)
            }
            
        case 3:
            if animals.levels[level].button3Correct == true
            {
                rightAnswer(btn3)
                // Tutorial
                if level == 0
                {
                    tutorialHand.hidden = true
                    answerLabel.borderColor = UIColor.greenColor()
                }
            }
            else
            {
                wrongAnswer(btn3)
            }
            
        case 4:
            if animals.levels[level].button4Correct == true
            {
                rightAnswer(btn4)
            }
            else
            {
                wrongAnswer(btn4)
            }
            
        case 5:
            if animals.levels[level].button5Correct == true
            {
                rightAnswer(btn5)
            }
            else
            {
                wrongAnswer(btn5)
            }
            
        case 6:
            if animals.levels[level].button6Correct == true
            {
                rightAnswer(btn6)
            }
            else
            {
                wrongAnswer(btn6)
            }
            
        default:
            println("outro")
            
        }
    }
    //================================================================================

    
    
    // MARK: - Right Answer
    //================================================================================
    func rightAnswer(buttonRight: UIButton) {
        
        //Set X and Y
        var x = self.answerLabel.frame.origin.x - buttonRight.frame.origin.x
        var y = self.answerLabel.frame.origin.y - buttonRight.frame.origin.y
        
        //Animation
        UIView.correctAnimation(self.view, buttonAnimate: buttonRight, xx: x, yy: y, displacementX: 0)
        
        //Timer
        self.disableButtons()
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
        
        //Persistence
        if persistence.verifyExistenceOfALevel("Animals", level: level) {
            persistence.updateNumberOfStars("Animals", level: level, numberOfStars: lifes)
        } else {
            persistence.newScore("Animals", level: level, quantityOfStars: lifes)
        }
    }
    //================================================================================
 
    
    
    // MARK: - Wrong Answer
    //================================================================================
    func wrongAnswer(buttonWrong: UIButton) {
        
        // Animation
        UIView.wrongAnimation(self.view, buttonAnimate: buttonWrong, disableButton: true)
        
        // Life --
        lostLife()
    }
    
    func lostLife() {
        lifes--
        
        // Update Score
        UIView.updateScore(lifes, imgScore: imgScore)
        
        // Game Over
        if lifes == 0
        {
            self.disableButtons()
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
        }
    }
    //================================================================================

    
    
    // MARK: - Level Won
    //================================================================================
    func congratulations() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("CongratulationsView") as! CongratulationsViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        storyBoardLevels.numberOfStars = lifes
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }
    //================================================================================
    
    @IBAction func buttonBack(sender: KPButton) {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    //================================================================================
    
    
    func disableButtons()
    {
        btn1.enabled = false
        btn2.enabled = false
        btn3.enabled = false
        btn4.enabled = false
        btn5.enabled = false
        btn6.enabled = false
    }
}
