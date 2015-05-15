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
    
    @IBOutlet weak var answerOp1: UITextField!
    @IBOutlet weak var answerOp2: UITextField!
    
    var level = 0
    
    var levels: [(lvl:Int,
                  firstOp:String,
                  correctAnswer1:String,
                  secondOp:String,
                  correctAnswer2:String)]

    = [(1, "1  +  2  =", "3",    "3  +  4  =", "7"),
       (2, "2  +  2  =", "4",    "5  +  4  =", "9"),
       (3, "4  +  2  =", "6",    "5  -  4  =", "1"),
       (4, "5  -  2  =", "3",    "9  -  3  =", "6"),
       (5, "10  -  5  =", "5",   "2  -  2  =", "0"),
       (6, "6  -  4  =", "2",    "1  x  5  =", "5"),
       (7, "3  x  3  =", "9",    "2  x  3  =", "6"),
       (8, "5  x  2  =", "10",   "2  ÷  1  =", "2"),
       (9, "10  ÷  2  =", "5",   "8  ÷  4  =", "2")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        answerOp1.layer.borderWidth = 2
        answerOp1.layer.borderColor = UIColor .grayColor().CGColor
        answerOp1.layer.cornerRadius = 10
        
        answerOp2.layer.borderWidth = 2
        answerOp2.layer.borderColor = UIColor .grayColor().CGColor
        answerOp2.layer.cornerRadius = 10
        
        getOps(level)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getOps(number: Int) {
        op1.text = levels[number].firstOp
        op2.text = levels[number].secondOp
    }
    
    @IBAction func btnDone(sender: UIButton) {
        
        if answerOp1.text == levels[level].correctAnswer1 &&
           answerOp2.text == levels[level].correctAnswer2 {
            answerOp1.layer.borderColor = UIColor.greenColor().CGColor
            answerOp2.layer.borderColor = UIColor.greenColor().CGColor
            UIView.congratulationView(self.view)
            self.dismissViewControllerAnimated(true, completion: {})
            println("Acertou!")
        } else {
            if answerOp1.text == levels[level].correctAnswer1
            {
                answerOp1.layer.borderColor = UIColor.greenColor().CGColor
            } else {
                answerOp1.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(answerOp1)
            }
        
            if answerOp2.text == levels[level].correctAnswer2
            {
                answerOp2.layer.borderColor = UIColor.greenColor().CGColor
            } else {
                answerOp2.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(answerOp2)
            }

        }
        
        
    }
    
    func wrongAnimation(textFieldAnimate: UITextField)
    {
        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x-20, 0);
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    textFieldAnimate.transform = CGAffineTransformMakeTranslation(0, 0);
                                    }, completion: { (finished) -> Void in
                                })
                        })
                })
        }

    }
    
    
}