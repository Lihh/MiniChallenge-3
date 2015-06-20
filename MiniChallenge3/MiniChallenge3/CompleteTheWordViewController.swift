//
//  CompleteTheWordViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 15/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CompleteTheWordViewController: UIViewController {

    // MARK: - Properties and Outlets
    //============================================================
    
    // Level
    var level: Int! = 0
    
    // Lifes
    var lifes: Int = 3
    
    // Finish - Number of correct buttons
    var finish: Int = 0
    
    // Notification Center
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
    // Singleton
    let completeWord = CompleteTheWordModel.sharedInstance
    var persistence = Persistence.sharedInstance
    
    // Outlets
    @IBOutlet weak var tutorialHand: UIButton!
    @IBOutlet weak var imgImage: UIImageView!
    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    //============================================================
    
    
    
    // MARK: - VC Life Cycle
    //============================================================
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
            UIView.showTutorial(self.view, hand: tutorialHand, destiny1: lblWord, x1: 35, y1: 20, destiny2: button1, x2: 160, y2: 35)
            button1.enabled = true
        }
    }
    //============================================================
    
    
    
    // MARK: - Game Configuration
    //============================================================
    func discoverLevel(notification: NSNotification) {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        levelConfiguration()
        buttonsConfiguration()
    }
    
    func levelConfiguration()
    {
        // Set Image
        UIView.setImageInImageView(imgImage, imageName: completeWord.levels[level].wordImage)
        
        // Set Incomplete Word
        UIView.setTextInLabel(lblWord, labelText: completeWord.levels[level].incompleteWord)
    }
    
    func buttonsConfiguration()
    {
        tutorialHand.hidden = true
        UIView.setTextInButton(button1, buttonText: completeWord.levels[level].button1Text)
        UIView.setTextInButton(button2, buttonText: completeWord.levels[level].button2Text)
        UIView.setTextInButton(button3, buttonText: completeWord.levels[level].button3Text)
        UIView.setTextInButton(button4, buttonText: completeWord.levels[level].button4Text)
        UIView.setTextInButton(button5, buttonText: completeWord.levels[level].button5Text)
    }
    //============================================================
    
    
    
    // MARK: - Buttons Click
    //============================================================
    
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if completeWord.levels[level].button1Correct == true
            { correctButton(button1, displacementX: completeWord.levels[level].button1Displacement)
              if level == 0
              { tutorialHand.hidden = true }
            }
            else
            { lostLife(button1) }
            
        case 2:
            if completeWord.levels[level].button2Correct == true
            { correctButton(button2, displacementX: completeWord.levels[level].button2Displacement) }
            else
            { lostLife(button2) }
            
        case 3:
            if completeWord.levels[level].button3Correct == true
            { correctButton(button3, displacementX: completeWord.levels[level].button3Displacement) }
            else
            { lostLife(button3) }
            
        case 4:
            if completeWord.levels[level].button4Correct == true
            { correctButton(button4, displacementX: completeWord.levels[level].button4Displacement) }
            else
            { lostLife(button4) }
            
        case 5:
            if completeWord.levels[level].button5Correct == true
            { correctButton(button5, displacementX: completeWord.levels[level].button5Displacement) }
            else
            { lostLife(button5) }
            
        default:
            println("outro")
        }
    }
    //============================================================
    
    
    
    // MARK: - Animation for Correct Button
    //============================================================
    func correctButton(buttonAnimate: UIButton, displacementX: CGFloat)
    {
        finish++
        
        // Set the Displacement of Button
        var xx = self.lblWord.frame.origin.x - buttonAnimate.frame.origin.x
        xx = xx + (48 * displacementX)
        var yy = self.lblWord.frame.origin.y - buttonAnimate.frame.origin.y - 6
        
        // Animation
        UIView.correctAnimation(self.view, buttonAnimate: buttonAnimate, xx: xx, yy: yy, displacementX: displacementX)
        
        // Game Win
        if self.finish == completeWord.levels[level].finish
        {
            if self.persistence.verifyExistenceOfALevel("completeTheWord", level: self.level)
            {
                self.persistence.updateNumberOfStars("completeTheWord", level: self.level, numberOfStars: self.lifes)
            }
            else
            {
                self.persistence.newScore("completeTheWord", level: self.level, quantityOfStars: self.lifes)
            }
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
        }
    }
    //============================================================

    
    
    // MARK: - Animation for Wrong Button
    //============================================================
    func lostLife(buttonAnimate: UIButton)
    {
        lifes--
        
        // Animation
        UIView.wrongAnimation(self.view, buttonAnimate: buttonAnimate, disableButton: true)
        
        // Game Over
        if lifes == 0
        { var timer = NSTimer.scheduledTimerWithTimeInterval(1.3, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
        }
    }
    //============================================================
    
    func congratulations() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let storyBoardLevels = storyBoard.instantiateViewControllerWithIdentifier("CongratulationsView") as! UIViewController
        storyBoardLevels.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
        presentViewController(storyBoardLevels, animated: true, completion: nil)
    }
    
    // MARK: - Exit Game
    //================================================================================
    func dismiss()
    { self.dismissViewControllerAnimated(true, completion: nil) }
    
    @IBAction func btnBack(sender: KPButton)
    { self.dismissViewControllerAnimated(true, completion: nil) }
    //================================================================================
    
    
    func disableButtons()
    {
        button1.enabled = false
        button2.enabled = false
        button3.enabled = false
        button4.enabled = false
        button5.enabled = false
    }
}
