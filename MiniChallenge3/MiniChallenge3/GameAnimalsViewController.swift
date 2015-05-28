//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameAnimalsViewController: UIViewController {

    @IBOutlet weak var tutorialHand: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btn1: KPButton!
    @IBOutlet weak var btn2: KPButton!
    @IBOutlet weak var btn3: KPButton!
    @IBOutlet weak var btn4: KPButton!
    @IBOutlet weak var btn5: KPButton!
    @IBOutlet weak var btn6: KPButton!
    
    @IBOutlet weak var answerLabel: UILabel!
    
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO", "PEIXE", "CAVALO", "COELHO", "TIGRE", "HIPOPOTAMO", "CAMELO"]
    
    
    var levels: [(lvl:Int,
    nameAnimal:String,
    labelText: String,
    button1Text: String, button1Correct:Bool,
    button2Text: String, button2Correct:Bool,
    button3Text: String, button3Correct:Bool,
    button4Text: String, button4Correct:Bool,
    button5Text: String, button5Correct:Bool,
    button6Text: String, button6Correct:Bool)]
    //1
    = [(1, "CACHORRO",
            "________",
            "GATO", false, "CAVALO", false, "CACHORRO", true,
            "URSO", false, "RAPOSA", false, "BORBOLETA", false),
        //2
        (2, "GATO",
            "____",
            "CACHORRO", false, "URSO", false, "LEAO", false,
            "COELHO", false, "GATO", true, "RATO", false),
        //3
        (3, "PASSARO",
            "_______",
            "BORBOLETA", false, "LOBO", false, "URUBU", false,
            "PASSARO", true, "FORMIGA", false, "MACACO", false),
        //4
        (4, "PEIXE",
            "_____",
            "TUBARAO", false, "GOLFINHO", false, "BALEIA", false,
            "TUCANO", false, "CAVALO", false, "PEIXE", true),
        //5
        (5, "CAVALO",
            "______",
            "CAVALO", true, "CACHORRO", false, "ELEFANTE", false,
            "ZEBRA", false, "CAMELO", false, "BOI", false),
        //6
        (6, "COELHO",
            "______",
            "GATO", false, "ABELHA", false, "LEAO", false,
            "RATO", false, "COELHO", true, "PASSARO", false),
        //7
        (7, "TIGRE",
            "_____",
            "LEAO", false, "TIGRE", true, "GATO", false,
            "CACHORRO", false, "CAVALO", false, "ONCA", false),
        //8
        (8, "HIPOPOTAMO",
            "__________",
            "CAVALO", false, "CACHORRO", false, "RINOCERONTE", false,
            "AGUIA", false, "ELEFANTE", false, "HIPOPOTAMO", true),
        //9
        (9, "CAMELO",
            "______",
            "GOELHO", false, "CAVALO", false, "DROMEDARIO", false,
            "CAMELO", true, "MARIPOSA", false, "MACACO", false)]
    
    var level = 0
    var nameAnimal: String!
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var lifes = 3
    let persistence = Persistence.sharedInstance
    
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
            btn3.enabled = true
        }
    }
    
    func getLvl(notification: NSNotification) {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        nameAnimal = levels[level].nameAnimal
        var var1 = NSBundle.mainBundle().pathForResource(nameAnimal, ofType: "png")
        var img = UIImage(contentsOfFile: var1!)
        imageView.image = img
        
        answerLabel.text = levels[level].labelText
        
        tutorialHand.hidden = true
        btn1.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        btn2.setTitle(levels[level].button2Text, forState: UIControlState.Normal)
        btn3.setTitle(levels[level].button3Text, forState: UIControlState.Normal)
        btn4.setTitle(levels[level].button4Text, forState: UIControlState.Normal)
        btn5.setTitle(levels[level].button5Text, forState: UIControlState.Normal)
        btn6.setTitle(levels[level].button6Text, forState: UIControlState.Normal)
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
    
    @IBAction func btnClicked(sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            if levels[level].button1Correct == true
            {
                rightAnswer(btn1)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn1)
                lostLife()
                
            }
            
        case 2:
            if levels[level].button2Correct == true
            {
                rightAnswer(btn2)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn2)
                lostLife()
            }
            
        case 3:
            if levels[level].button3Correct == true
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
                UIView.wrongAnimation(self.view, buttonAnimate: btn3)
                lostLife()
            }
            
        case 4:
            if levels[level].button4Correct == true
            {
                rightAnswer(btn4)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn4)
                lostLife()
            }
            
        case 5:
            if levels[level].button5Correct == true
            {
                rightAnswer(btn5)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btn5)
                lostLife()
            }
            
        case 6:
            if levels[level].button6Correct == true
            {
                rightAnswer(btn6)
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
    
    
    func rightAnswer(buttonRight: UIButton) {
        
        var x = self.answerLabel.frame.origin.x - buttonRight.frame.origin.x
        var y = self.answerLabel.frame.origin.y - buttonRight.frame.origin.y
        
        UIView.correctAnimation(self.view, buttonAnimate: buttonRight, xx: x, yy: y, displacementX: 0)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
            
        if persistence.verifyExistenceOfALevel("Animals", level: level) {
            persistence.updateNumberOfStars("Animals", level: level, numberOfStars: lifes)
        } else {
            persistence.newScore("Animals", level: level, quantityOfStars: lifes)
        }
        
        
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }


    
    @IBAction func buttonBack(sender: KPButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
