//
//  GameCalculatorViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameCalculatorViewController: UIViewController {

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
    
    var level = 0
    
    var lifes = 3
    
    var gameOver = 0
    
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var persistence = Persistence.sharedInstance
    
    var levels: [(lvl:Int,
                  firstOp:String,
                  correctAnswer1:String,
                  secondOp:String,
                  correctAnswer2:String,
                  button1Text: String, button1Correct:Bool,
                  button2Text: String, button2Correct:Bool,
                  button3Text: String, button3Correct:Bool,
                  button4Text: String, button4Correct:Bool,
                  button5Text: String, button5Correct:Bool,
                  button6Text: String, button6Correct:Bool)]
        //1
    = [(1, "1  +  2", "3",    "3  +  4", "7",
        "2", false, "4", false, "3", true,
        "7", true, "5", false, "6", false),
        //2
       (2, "2  +  2", "4",    "5  +  4", "9",
        "7", false, "4", true, "8", false,
        "0", false, "9", true, "2", false),
        //3
       (3, "4  +  2", "6",    "5  -  4", "1",
        "5", false, "2", false, "6", true,
        "1", true, "0", false, "9", false),
        //4
       (4, "5  -  2", "3",    "9  -  3", "6",
        "0", false, "3", true, "7", false,
        "3", false, "6", true, "9", false),
        //5
       (5, "10  -  5", "5",   "2  -  2", "0",
        "5", true, "9", false, "6", false,
        "0", true, "8", false, "1", false),
        //6
       (6, "6  -  4", "2",    "1  x  5", "5",
        "4", false, "3", false, "2", true,
        "1", false, "5", true, "0", false),
        //7
       (7, "3  x  3", "9",    "2  x  3", "6",
        "7", false, "9", true, "3", false,
        "8", false, "0", false, "6", true),
        //8
       (8, "4  x  2", "8",   "2  ÷  1", "2",
        "8", true, "7", false, "0", false,
        "2", true, "4", false, "1", false),
        //9
       (9, "10  ÷  2", "5",   "8  ÷  4", "2",
        "0", false, "9", false, "5", true,
        "7", false, "2", true, "4", false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerOp1.layer.borderWidth = 2
        answerOp1.layer.borderColor = UIColor .whiteColor().CGColor
        answerOp1.layer.cornerRadius = 6
        
        answerOp2.layer.borderWidth = 2
        answerOp2.layer.borderColor = UIColor .whiteColor().CGColor
        answerOp2.layer.cornerRadius = 6
        
        notificationCenter.addObserver(self, selector: Selector("discoverLevel:"), name: "CurrentLevelMathExercise", object: nil)
        

    }
    
    func discoverLevel(notification: NSNotification) {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        getLvl(level)
    }
    
    func getLvl(number: Int) {
        op1.text = levels[number].firstOp
        op2.text = levels[number].secondOp
        
        btn1.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        btn2.setTitle(levels[level].button2Text, forState: UIControlState.Normal)
        btn3.setTitle(levels[level].button3Text, forState: UIControlState.Normal)
        btn4.setTitle(levels[level].button4Text, forState: UIControlState.Normal)
        btn5.setTitle(levels[level].button5Text, forState: UIControlState.Normal)
        btn6.setTitle(levels[level].button6Text, forState: UIControlState.Normal)

    }
    
    @IBAction func btnClicked(sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            if levels[level].button1Correct == true
            {
                rightAnswer(btn1, op: 1)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn1)
                lostLife()
                
            }
            
        case 2:
            if levels[level].button2Correct == true
            {
                rightAnswer(btn2, op: 1)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn2)
                lostLife()
            }
            
        case 3:
            if levels[level].button3Correct == true
            {
                rightAnswer(btn3, op: 1)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn3)
                lostLife()
            }
            
        case 4:
            if levels[level].button4Correct == true
            {
                rightAnswer(btn4, op: 2)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn4)
                lostLife()
            }
            
        case 5:
            if levels[level].button5Correct == true
            {
                rightAnswer(btn5, op: 2)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn5)
                lostLife()
            }
            
        case 6:
            if levels[level].button6Correct == true
            {
                rightAnswer(btn6, op: 2)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn6)
                lostLife()
            }
            
        default:
            println("outro")
        
        }
        
    }
    
    func lostLife() {
        
        lifes--
        
        
        if lifes == 0 {
            
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
        }
        
    }
    
    
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
            var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
            
            if self.persistence.verifyExistenceOfALevel("Calculator", level: self.level) {
                self.persistence.updateNumberOfStars("Calculator", level: self.level, numberOfStars: self.lifes)
            } else {
                self.persistence.newScore("Calculator", level: self.level, quantityOfStars: self.lifes)
            }

        }
        
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func btnBack(sender: KPButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
