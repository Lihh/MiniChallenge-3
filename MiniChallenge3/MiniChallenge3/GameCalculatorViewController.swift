//
//  GameCalculatorViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameCalculatorViewController: UIViewController, UITextFieldDelegate {

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
        
        self.answerOp1.delegate = self
        self.answerOp2.delegate = self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        answerOp1.resignFirstResponder()
        answerOp2.resignFirstResponder()
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
                UIView.wrongAnimation(self.view, textFieldAnimate:answerOp1)
            }
        
            if answerOp2.text == levels[level].correctAnswer2
            {
                answerOp2.layer.borderColor = UIColor.greenColor().CGColor
            } else {
                answerOp2.layer.borderColor = UIColor.redColor().CGColor
                UIView.wrongAnimation(self.view, textFieldAnimate:answerOp2)
            }
        }
    }
    
    @IBAction func btnBack(sender: KPButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}