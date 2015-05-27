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
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var persistence = Persistence.sharedInstance
    
    // Outlets
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
        "A", true, 1, "B", false, 0, "C", false, 0, "R", false, 0, "E", false, 0),
    
    // Level 2
        (2, "PEIXE", "P E _ X _", 2,
        "A", false, 0, "F", false, 0, "I", true, 2, "T", false, 0, "E", true, 4),
        
    // Level 3
        (3, "COELHO", "C _ E _ H O", 2,
        "O", true, 1, "E", false, 0, "I", false, 0, "L", true, 3, "U", false, 0),
        
    // Level 4
        (4, "CAVALO", "C _ V A _ _", 3,
        "C", false, 0, "A", true, 1, "L", true, 4.1, "F", false, 0, "O", true, 5.08),
        
    // Level 5
        (5, "TIGRE", "T _ G _ _", 3,
        "I", true, 0.8, "T", false, 0, "H", false, 0, "R", true, 3, "E", true, 3.95),
        
    // Level 6
        (6, "ESQUILO", "E S _ U _ L _", 3,
        "F", false, 0, "Q", true, 2, "I", true, 4.15, "L", false, 0, "O", true, 6.1),
        
    // Level 7
        (7, "PASSARO", "P _ S _ A _ O", 3,
        "A", true, 0.9, "S", true, 3, "I", false, 0, "R", true, 5, "U", false, 0),
        
    // Level 8
        (8, "ELEFANTE", "E L E _ A _ T _", 3,
        "O", false, 0, "F", true, 3, "N", true, 5, "M", false, 0, "E", true, 7),
        
    // Level 9
        (9, "HIPOPOTAMO", "H _ _ O P O _ A _ O", 4,
        "I", true, 1, "P", true, 2, "Q", false, 0, "T", true, 6.55, "M", true, 8.6)]
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
        // code
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnBack(sender: KPButton)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
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
        button1.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        button2.setTitle(levels[level].button2Text, forState: UIControlState.Normal)
        button3.setTitle(levels[level].button3Text, forState: UIControlState.Normal)
        button4.setTitle(levels[level].button4Text, forState: UIControlState.Normal)
        button5.setTitle(levels[level].button5Text, forState: UIControlState.Normal)
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
            { correctButton(button1, displacementX: levels[level].button1Displacement) }
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
    
    func addButtonBlurEfect(buttonBlur: AnyObject)
    {
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = buttonBlur.bounds
        buttonBlur.addSubview(blurView)
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
        var yy = self.lblWord.frame.origin.y - buttonAnimate.frame.origin.y
        
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

    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
