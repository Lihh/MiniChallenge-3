//
//  SyllablesViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 14/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class SyllablesViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties and Outlets
    //================================================================================
    // Lifes
    var lifes: Int = 3
    
    // Score
    var score: Int = 0
    
    // Level
    var level: Int!
    
    // Notification Center
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    // Singletons
    let syllable = ModelSyllables.sharedInstance
    let persistence = Persistence.sharedInstance
    
    // Outlets
    @IBOutlet weak var imgScore: UIImageView!
    @IBOutlet weak var imgImage1: UIImageView!
    @IBOutlet weak var lblDeleteSyllable1: UILabel!
    @IBOutlet weak var lblPositionSyllable1: UILabel!
    
    @IBOutlet weak var imgImage2: UIImageView!
    @IBOutlet weak var lblDeleteSyllable2: UILabel!
    @IBOutlet weak var lblPositionSyllable2: UILabel!
    
    @IBOutlet weak var imgImage3: UIImageView!
    @IBOutlet weak var lblDeleteSyllable3: UILabel!
    @IBOutlet weak var lblPositionSyllable3: UILabel!
    
    @IBOutlet weak var tutorialHand: UIButton!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption4: UIButton!
    @IBOutlet weak var btnOption5: UIButton!
    @IBOutlet weak var btnOption6: UIButton!
    @IBOutlet weak var btnOption7: UIButton!
    @IBOutlet weak var btnOption8: UIButton!
    //================================================================================
    
    var audioPlayerSound = AVAudioPlayer()
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)
    
    
    // MARK: - VC Lyfe Cycle
    //================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: Selector("discoverLevel:"), name: "CurrentLevelPortugueseExercise", object: nil)
    }
    
    override func viewWillAppear(animated: Bool)
    {
        // Show Tutorial
        if level == 0
        {
            tutorialHand.hidden = false
            disableButtons()
            UIView.showTutorial(self.view, hand: tutorialHand, destiny1: lblPositionSyllable1, x1: -10, y1: +20, destiny2: btnOption1, x2: 405, y2: +15)
        }
    }
    //================================================================================
    
    
    
    // MARK: - Game Configuration
    //================================================================================
    func discoverLevel(notification: NSNotification)
    {
        // Get Level
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        gameConfiguration()
    }
    
    func gameConfiguration()
    {
        // Score
        UIView.setImageInImageView(imgScore, imageName: "ThreeStarsFilled")
        
        // Tutorial
        tutorialHand.hidden = true
        
        // Images
        UIView.setImageInImageView(imgImage1, imageName: syllable.levels[level].image1)
        UIView.setImageInImageView(imgImage2, imageName: syllable.levels[level].image2)
        UIView.setImageInImageView(imgImage3, imageName: syllable.levels[level].image3)
        
        // Labels
        UIView.setTextInLabel(lblDeleteSyllable1, labelText: syllable.levels[level].deleteSyllable1)
        UIView.setTextInLabel(lblDeleteSyllable2, labelText: syllable.levels[level].deleteSyllable2)
        UIView.setTextInLabel(lblDeleteSyllable3, labelText: syllable.levels[level].deleteSyllable3)
        
        // Buttons
        UIView.setTextInButton(btnOption1, buttonText: syllable.levels[level].button1Text)
        UIView.setTextInButton(btnOption2, buttonText: syllable.levels[level].button2Text)
        UIView.setTextInButton(btnOption3, buttonText: syllable.levels[level].button3Text)
        UIView.setTextInButton(btnOption4, buttonText: syllable.levels[level].button4Text)
        UIView.setTextInButton(btnOption5, buttonText: syllable.levels[level].button5Text)
        UIView.setTextInButton(btnOption6, buttonText: syllable.levels[level].button6Text)
        UIView.setTextInButton(btnOption7, buttonText: syllable.levels[level].button7Text)
        UIView.setTextInButton(btnOption8, buttonText: syllable.levels[level].button8Text)
    }
    //================================================================================
    
    
    
    // MARK: - Button Click
    //================================================================================
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if syllable.levels[level].button1Correct == true
            { rightButton(btnOption1, buttonPosition: syllable.levels[level].Button1Position)
                if level == 0
                // Tutorial
                {
                    disableButtons()
                    syllable.showTutorial(self.view, greenLabel: lblPositionSyllable1, hand:tutorialHand, handX: 40, handY: 400, destiny1: lblPositionSyllable2, d1x: -115, d1y: 640, destiny2: btnOption2, d2x: 390, d2y: 630)
                }
            }
            else
            { wrongButton(btnOption1) }
            
        case 2:
            if syllable.levels[level].button2Correct == true
            { rightButton(btnOption2, buttonPosition: syllable.levels[level].Button2Position)
                // Tutorial
                if level == 0
                {
                    disableButtons()
                    syllable.showTutorial(self.view, greenLabel:lblPositionSyllable2, hand:tutorialHand, handX: 30, handY: 580, destiny1: lblPositionSyllable3, d1x: 55, d1y: 1050, destiny2: btnOption3, d2x: 570, d2y: 1050)
                }
            }
            else
            { wrongButton(btnOption2) }
            
        case 3:

            if syllable.levels[level].button3Correct == true
            { rightButton(btnOption3, buttonPosition: syllable.levels[level].Button3Position)
                // Tutorial
                if level == 0
                {
                    lblPositionSyllable3.borderColor = UIColor.greenColor()
                    tutorialHand.hidden = true
                }
            }
            else
            { wrongButton(btnOption3) }
            
        case 4:
            if syllable.levels[level].button4Correct == true
            { rightButton(btnOption4, buttonPosition: syllable.levels[level].Button4Position) }
            else
            { wrongButton(btnOption4) }
            
        case 5:
            if syllable.levels[level].button5Correct == true
            { rightButton(btnOption5, buttonPosition: syllable.levels[level].Button5Position) }
            else
            { wrongButton(btnOption5) }
            
        case 6:
            if syllable.levels[level].button6Correct == true
            { rightButton(btnOption6, buttonPosition: syllable.levels[level].Button6Position) }
            else
            { wrongButton(btnOption6) }
            
        case 7:
            if syllable.levels[level].button7Correct == true
            { rightButton(btnOption7, buttonPosition: syllable.levels[level].Button7Position)
            }
            else { wrongButton(btnOption7) }
            
        case 8:
            if syllable.levels[level].button8Correct == true
            { rightButton(btnOption8, buttonPosition: syllable.levels[level].Button8Position)
            }
            else
            { wrongButton(btnOption8) }
            
        default:
            println("outro")
        }
    }
    //================================================================================
    
    
    
    // MARK: - Right Button
    //================================================================================
    func rightButton(button: UIButton, buttonPosition: Int)
    {
        // Score ++
        score++
        
        // Displace the Syllable
        syllable.displaceButton(self.view ,button: button, buttonPosition: buttonPosition, labelPosition1: lblPositionSyllable1, labelPosition2: lblPositionSyllable2, labelPosition3: lblPositionSyllable3)
        
        // Game Won - Persistence
        if score == 3
        {
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
            
            if self.persistence.verifyExistenceOfALevel("gameSyllables", level: self.level)
            { self.persistence.updateNumberOfStars("gameSyllables", level: self.level, numberOfStars: self.lifes) }
            else
            { self.persistence.newScore("gameSyllables", level: self.level, quantityOfStars: self.lifes) }
        }
    }
    //================================================================================
    
    
    
    // MARK: - Wrong Button
    //================================================================================
    func wrongButton(button: UIButton)
    {
        // Animate wrong Syllable
        UIView.wrongAnimation(self.view, buttonAnimate: button, disableButton: true)
        
        // Lifes --
        lifes--
        
        // Update Score
        UIView.updateScore(lifes, imgScore: imgScore)
        
        // Game Over
        if lifes == 0
        { var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("dismissView"), userInfo: nil, repeats: false) }
    }
    //================================================================================
    
    
    
    // MARK: - Exit Game
    //================================================================================
    @IBAction func btnBack(sender: KPButton){
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func congratulations() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("CongratulationsView") as! CongratulationsViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        storyBoardLevels.numberOfStars = lifes
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }
    
    func dismissView() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    //================================================================================
    
    
    func disableButtons()
    {
        btnOption1.enabled = false
        btnOption2.enabled = false
        btnOption3.enabled = false
        btnOption4.enabled = false
        btnOption5.enabled = false
        btnOption6.enabled = false
        btnOption7.enabled = false
        btnOption8.enabled = false
    }
    
}
