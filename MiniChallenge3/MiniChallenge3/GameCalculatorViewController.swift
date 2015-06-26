//
//  GameCalculatorViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class GameCalculatorViewController: UIViewController {

    // MARK: - Properties and Outlets
    //================================================================================
    @IBOutlet weak var tutorialHand: UIButton!
    @IBOutlet weak var imgScore: UIImageView!
    
    @IBOutlet weak var op1: UILabel!
    @IBOutlet weak var op2: UILabel!
    
    @IBOutlet weak var answerOp1: UILabel!
    @IBOutlet weak var answerOp2: UILabel!
    
    @IBOutlet weak var btn1: KPButton!
    @IBOutlet weak var btn2: KPButton!
    @IBOutlet weak var btn3: KPButton!
    @IBOutlet weak var btn4: KPButton!
    @IBOutlet weak var btn5: KPButton!
    @IBOutlet weak var btn6: KPButton!
    
    // Game Level and Lifes
    var level = 0
    var lifes = 3
    
    //Checking if user clicked all correct buttons
    var gameOver = 0
    
    //Notification Center
    var notificationCenter = NSNotificationCenter.defaultCenter()
    
    //Singletons
    let persistence = Persistence.sharedInstance
    let calculator = CalculatorModel.sharedInstance
    //================================================================================
    
    var audioPlayerSound = AVAudioPlayer()
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)

    
    
    // MARK: - VC Life Cycle
    //================================================================================
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Setting Labels config
        answerOp1.layer.borderWidth = 2
        answerOp1.layer.borderColor = UIColor .whiteColor().CGColor
        answerOp1.layer.cornerRadius = 6
        
        answerOp2.layer.borderWidth = 2
        answerOp2.layer.borderColor = UIColor .whiteColor().CGColor
        answerOp2.layer.cornerRadius = 6
        
        //Notification Center
        notificationCenter.addObserver(self, selector: Selector("getLvl:"), name: "CurrentLevelMathExercise", object: nil)
    }
    
    override func viewDidLayoutSubviews() {
        for v in view.subviews {
            if let vv = v as? UIControl {
                vv.exclusiveTouch = true
            }
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        // Show Tutorial
        if level == 0
        {
            tutorialHand.hidden = false
            disableButtons()
            UIView.showTutorial(self.view, hand: tutorialHand, destiny1: answerOp1, x1: -15, y1: 25, destiny2: btn3, x2: 330, y2: 30)
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
        
        //Labels
        UIView.setTextInLabel(op1, labelText: calculator.levels[level].firstOp)
        UIView.setTextInLabel(op2, labelText: calculator.levels[level].secondOp)
    }
    
    func buttonsConfiguration() {
        tutorialHand.hidden = true
        UIView.setTextInButton(btn1, buttonText: calculator.levels[level].button1Text)
        UIView.setTextInButton(btn2, buttonText: calculator.levels[level].button2Text)
        UIView.setTextInButton(btn3, buttonText: calculator.levels[level].button3Text)
        UIView.setTextInButton(btn4, buttonText: calculator.levels[level].button4Text)
        UIView.setTextInButton(btn5, buttonText: calculator.levels[level].button5Text)
        UIView.setTextInButton(btn6, buttonText: calculator.levels[level].button6Text)
    }
    //================================================================================

    
    
    // MARK: - Button Click
    //================================================================================
    @IBAction func btnClicked(sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            if calculator.levels[level].button1Correct == true
            {
                rightAnswer(btn1, op: 1)
            }
            else
            {
                wrongAnswer(btn1)
            }
            
        case 2:
            if calculator.levels[level].button2Correct == true
            {
                rightAnswer(btn2, op: 1)
            }
            else
            {
                wrongAnswer(btn2)
            }
            
        case 3:
            if calculator.levels[level].button3Correct == true
            {
                rightAnswer(btn3, op: 1)
                // Tutorial
                if level == 0
                { showTutorial(answerOp1, handX: 60, handY: 490, destiny1: answerOp2, d1x: 450, d1y: 585, destiny2: btn4, d2x: 795, d2y: 585) }
            }
            else
            {
                wrongAnswer(btn3)
            }
            
        case 4:
            if calculator.levels[level].button4Correct == true
            {
                rightAnswer(btn4, op: 2)
                // Tutorial
                if level == 0
                {
                    answerOp2.borderColor = UIColor.greenColor()
                    tutorialHand.hidden = true
                }
            }
            else
            {
                wrongAnswer(btn4)
            }
            
        case 5:
            if calculator.levels[level].button5Correct == true
            {
                rightAnswer(btn5, op: 2)
            }
            else
            {
                wrongAnswer(btn5)
            }
            
        case 6:
            if calculator.levels[level].button6Correct == true
            {
                rightAnswer(btn6, op: 2)
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
    func rightAnswer(buttonRight: UIButton, op: Int) {
        
        gameOver++
        
        var x = CGFloat()
        var y = CGFloat()
        
        if op == 1 {
            x = self.answerOp1.frame.origin.x - buttonRight.frame.origin.x
            x = x + 60
            y = self.answerOp1.frame.origin.y - buttonRight.frame.origin.y
            println("Op 1")
        } else if op == 2 {
            x = self.answerOp2.frame.origin.x - buttonRight.frame.origin.x
            x = x + 60
            y = self.answerOp2.frame.origin.y - buttonRight.frame.origin.y
            println("Op 2")
        }
        
        UIView.correctAnimation(self.view, buttonAnimate: buttonRight, xx: x, yy: y, displacementX: 0)
        
        if gameOver == 2 {
            self.disableButtons()
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
            
            if self.persistence.verifyExistenceOfALevel("Calculator", level: self.level) {
                self.persistence.updateNumberOfStars("Calculator", level: self.level, numberOfStars: self.lifes)
            } else {
                self.persistence.newScore("Calculator", level: self.level, quantityOfStars: self.lifes)
            }
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
        
        if lifes == 0
        {
            self.disableButtons()
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("congratulations"), userInfo: nil, repeats: false)
        }
        
    }
    //================================================================================

    
    
    // MARK: - Tutorial
    //================================================================================
    func showTutorial(greenLabel:UILabel, handX:CGFloat, handY:CGFloat, destiny1:UILabel, d1x:CGFloat, d1y:CGFloat, destiny2:UIButton, d2x:CGFloat, d2y:CGFloat)
    {
        disableButtons()
        greenLabel.borderColor = UIColor.greenColor()
        tutorialHand.frame.origin.x = handX
        tutorialHand.frame.origin.y = handY
        UIView.showTutorial(self.view, hand: tutorialHand, destiny1: destiny1, x1: d1x, y1: d1y, destiny2: destiny2, x2: d2x, y2: d2y)
    }
    
    func disableButtons()
    {
        btn1.enabled = false
        btn2.enabled = false
        btn3.enabled = false
        btn4.enabled = false
        btn5.enabled = false
        btn6.enabled = false
    }
    //================================================================================
    
    
    
    // MARK: - Exit game
    //================================================================================
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnBack(sender: KPButton) {
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
    //================================================================================


}
