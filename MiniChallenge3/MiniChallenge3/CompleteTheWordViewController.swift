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
    
    // Persistence
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
    
    // Array Levels
    var levels: [(level:Int, wordImage:String, incompleteWord:String, finish:Int,
                  button1Text: String, button1Correct:Bool, button1Displacement: CGFloat,
                  button2Text: String, button2Correct:Bool, button2Displacement: CGFloat,
                  button3Text: String, button3Correct:Bool, button3Displacement: CGFloat,
                  button4Text: String, button4Correct:Bool, button4Displacement: CGFloat,
                  button5Text: String, button5Correct:Bool, button5Displacement: CGFloat)]
    // Level 1
    = [ (1, "GATO", "G _ T O", 1,
        "A", true, 1.1, "E", false, 0, "I", false, 0, "O", false, 0, "U", false, 0),
    
    // Level 2
        (2, "PEIXE", "P _ _ X E", 2,
        "A", false, 0, "E", true, 1.15, "I", true, 2.44, "O", false, 0, "U", false, 0),
        
    // Level 3
        (3, "COELHO", "C _ _ L H O", 2,
        "A", false, 0, "E", true, 2.35, "I", false, 0, "O", true, 1.05, "U", false, 0),
        
    // Level 4
        (4, "CACHORRO", "C _ C H _ R R O", 2,
        "A", true, 1.05, "E", false, 0,  "I", false, 0, "O", true, 4.77, "U", false, 0),
        
    // Level 5
        (5, "TIGRE", "T _ G R _ ", 2,
        "A", false, 0, "E", true, 5, "I", true, 1.25, "O", false, 0, "U", false, 0),
        
    // Level 6
        (6, "LEAO", "L _ _ O ", 2,
        "A", true, 2.55, "E", true, 1.2, "I", false, 0, "O", false, 0, "U", false, 0),
        
    // Level 7
        (7, "ESQUILO", " _ S Q _ _ L O", 3,
        "A", false, -0.3, "E", true, 0.35, "I", true, 5.34, "O", false, 0, "U", true, 4),
        
    // Level 8
        (8, "CAMELO", "C _ M _ L _ ", 3,
        "A", true, 1.25, "E", true, 4, "I", false, 0, "O", true, 6.43, "U", false, 0),
        
    // Level 9
        (9, "HIPOPOTAMO", "H _ P _ P O T _ M O", 3,
        "A", true, 8.6, "E", false, 0, "I", true, 1.2, "O", true, 3.7, "U", false, 0)]
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

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
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
        var imgAux = NSBundle.mainBundle().pathForResource(levels[level].wordImage, ofType: "png")
        imgImage.image = UIImage(contentsOfFile: imgAux!)
        
        // Set Incomplete Word
        lblWord.text = levels[level].incompleteWord
    }
    
    func buttonsConfiguration()
    {
        tutorialHand.hidden = true
        button1.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        button2.setTitle(levels[level].button2Text, forState: UIControlState.Normal)
        button3.setTitle(levels[level].button3Text, forState: UIControlState.Normal)
        button4.setTitle(levels[level].button4Text, forState: UIControlState.Normal)
        button5.setTitle(levels[level].button5Text, forState: UIControlState.Normal)
    }
    
    func disableButtons()
    {
        button1.enabled = false
        button2.enabled = false
        button3.enabled = false
        button4.enabled = false
        button5.enabled = false
    }
    //============================================================
    
    
    
    // MARK: - Buttons Click
    //============================================================
    
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if levels[level].button1Correct == true
            { correctButton(button1, displacementX: levels[level].button1Displacement)
              if level == 0
              { tutorialHand.hidden = true }
            }
            else
            { lostLife(button1) }
            
        case 2:
            if levels[level].button2Correct == true
            { correctButton(button2, displacementX: levels[level].button2Displacement) }
            else
            { lostLife(button2) }
            
        case 3:
            if levels[level].button3Correct == true
            { correctButton(button3, displacementX: levels[level].button3Displacement) }
            else
            { lostLife(button3) }
            
        case 4:
            if levels[level].button4Correct == true
            { correctButton(button4, displacementX: levels[level].button4Displacement) }
            else
            { lostLife(button4) }
            
        case 5:
            if levels[level].button5Correct == true
            { correctButton(button5, displacementX: levels[level].button5Displacement) }
            else
            { lostLife(button5) }
            
        default:
            println("outro")
        }
    }
    //============================================================
    
    
    
    // MARK: - Animation for Wrong Button
    //============================================================
    
    func lostLife(buttonAnimate: UIButton){
        lifes--
        UIView.wrongAnimation(self.view, buttonAnimate: buttonAnimate)
        if lifes == 0 {
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.3, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
        }
    }
    //============================================================
    
    
    
    // MARK: - Animation for Correct Button
    //============================================================
    func correctButton(buttonAnimate: UIButton, displacementX: CGFloat)
    {
        finish++
        println("Acertou!")
        
        // Set the Displacement of Button
        var xx = self.lblWord.frame.origin.x - buttonAnimate.frame.origin.x
        xx = xx + (48 * displacementX)
        var yy = self.lblWord.frame.origin.y - buttonAnimate.frame.origin.y - 6
        
        UIView.correctAnimation(self.view, buttonAnimate: buttonAnimate, xx: xx, yy: yy, displacementX: displacementX)
        
        if self.finish == self.levels[self.level].finish {
            if self.persistence.verifyExistenceOfALevel("completeTheWord", level: self.level) {
                self.persistence.updateNumberOfStars("completeTheWord", level: self.level, numberOfStars: self.lifes)
            } else {
                self.persistence.newScore("completeTheWord", level: self.level, quantityOfStars: self.lifes)
            }
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
        }
    }
    //============================================================

    
    
    // MARK: - Exit Game
    //================================================================================
    func dismiss()
    { self.dismissViewControllerAnimated(true, completion: nil) }
    
    @IBAction func btnBack(sender: KPButton)
    { self.dismissViewControllerAnimated(true, completion: nil) }
    //================================================================================
}
