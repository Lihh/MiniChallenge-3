//
//  SyllablesViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 14/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class SyllablesViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties and Outlets
    //================================================================================
    
    // Lifes
    var lifes: Int = 3
    
    // Acertos
    var acertos: Int = 0
    
    // Level
    var level: Int!
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    let persistence = Persistence.sharedInstance
    
    // Outlets
    @IBOutlet weak var imgImage1: UIImageView!
    @IBOutlet weak var lblDeleteSyllable1: UILabel!
    @IBOutlet weak var lblPositionSyllable1: UILabel!
    
    @IBOutlet weak var imgImage2: UIImageView!
    @IBOutlet weak var lblDeleteSyllable2: UILabel!
    @IBOutlet weak var lblPositionSyllable2: UILabel!
    
    @IBOutlet weak var imgImage3: UIImageView!
    @IBOutlet weak var lblDeleteSyllable3: UILabel!
    @IBOutlet weak var lblPositionSyllable3: UILabel!
    
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption4: UIButton!
    @IBOutlet weak var btnOption5: UIButton!
    @IBOutlet weak var btnOption6: UIButton!
    @IBOutlet weak var btnOption7: UIButton!
    @IBOutlet weak var btnOption8: UIButton!
    
    // Levels Array for images and syllables
    var levels: [( level:Int,    correctWord:String, correctImage:String,
                  image1:String, deleteSyllable1:String,
                  image2:String, deleteSyllable2:String,
                  image3:String, deleteSyllable3:String,
                  button1Text:String, button1Correct:Bool, Button1Position:Int,
                  button2Text:String, button2Correct:Bool, Button2Position:Int,
                  button3Text:String, button3Correct:Bool, Button3Position:Int,
                  button4Text:String, button4Correct:Bool, Button4Position:Int,
                  button5Text:String, button5Correct:Bool, Button5Position:Int,
                  button6Text:String, button6Correct:Bool, Button6Position:Int,
                  button7Text:String, button7Correct:Bool, Button7Position:Int,
                  button8Text:String, button8Correct:Bool, Button8Position:Int)]
    
        // Level 1
    = [(/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
        /* Image 1  */ "CACHORRO", /* Delete */ "RTELO",
        /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
        /* Image 3  */ "CACHORRO", /* Delete */ "RACAO",
        /* Button 1 */ "MA",      /* Delete */ true,  /* Position */ 1,
        /* Button 2 */ "CA",      /* Delete */ true,  /* Position */ 2,
        /* Button 3 */ "CO",      /* Delete */ true,  /* Position */ 3,
        /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
        /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
        /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
        /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
        /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 2
        (/* Level */ 2, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 3
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 4
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 5
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 6
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 7
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 8
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),
    
        // Level 9
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "CORACAO", /* Delete */ "RACAO",
         /* Button 1 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "CORACAO", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "CORACAO", /* Delete */ false, /* Position */ 0),]
    //================================================================================
    
    
    
    // MARK: - VC Lyfe Cycle
    //================================================================================
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
    
    //================================================================================
    
    
    
    // MARK: - Game Configuration
    //================================================================================
    func discoverLevel(notification: NSNotification)
    {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        gameConfiguration()
    }
    
    func gameConfiguration()
    {
        // Images and Syllables
        var imgAux = NSBundle.mainBundle().pathForResource(levels[level].image1, ofType: "png")
        imgImage1.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable1.text = levels[level].deleteSyllable1
        
        imgAux = NSBundle.mainBundle().pathForResource(levels[level].image2, ofType: "png")
        imgImage2.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable2.text = levels[level].deleteSyllable2
        
        imgAux = NSBundle.mainBundle().pathForResource(levels[level].image3, ofType: "png")
        imgImage3.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable3.text = levels[level].deleteSyllable3
        
        // Buttons
        btnOption1.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        btnOption2.setTitle(levels[level].button2Text, forState: UIControlState.Normal)
        btnOption3.setTitle(levels[level].button3Text, forState: UIControlState.Normal)
        btnOption4.setTitle(levels[level].button4Text, forState: UIControlState.Normal)
        btnOption5.setTitle(levels[level].button5Text, forState: UIControlState.Normal)
        btnOption6.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        btnOption7.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
        btnOption8.setTitle(levels[level].button1Text, forState: UIControlState.Normal)
    }
    //================================================================================
    
    
    
    // MARK: - Button Click
    //================================================================================
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if levels[level].button1Correct == true
            {
                displacementPosition(btnOption1, buttonPosition: levels[level].Button1Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption1)
                countError()
            }
            
        case 2:
            if levels[level].button2Correct == true
            {
                displacementPosition(btnOption2, buttonPosition: levels[level].Button2Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption2)
                countError()
            }
            
        case 3:
            if levels[level].button1Correct == true
            {
                displacementPosition(btnOption3, buttonPosition: levels[level].Button3Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption3)
                countError()
            }
            
        case 4:
            if levels[level].button4Correct == true
            {
                displacementPosition(btnOption4, buttonPosition: levels[level].Button4Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption4)
                countError()
            }
            
        case 5:
            if levels[level].button5Correct == true
            {
                displacementPosition(btnOption5, buttonPosition: levels[level].Button5Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption5)
                countError()
            }
            
        case 6:
            if levels[level].button6Correct == true
            {
                displacementPosition(btnOption6, buttonPosition: levels[level].Button6Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption6)
                countError()
            }
            
        case 7:
            if levels[level].button7Correct == true
            {
                displacementPosition(btnOption7, buttonPosition: levels[level].Button7Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption7)
                countError()
            }
            
        case 8:
            if levels[level].button8Correct == true
            {
                displacementPosition(btnOption8, buttonPosition: levels[level].Button8Position)
            }
            else
            {
                UIView.wrongAnimation(self.view, buttonAnimate: btnOption8)
                countError()
            }
            
        default:
            println("outro")
        }
    }
    //================================================================================
    
    func displacementPosition(buttonDisplace: UIButton, buttonPosition: Int)
    {
        acertos++
        
        var x = CGFloat()
        var y = CGFloat()
        
        switch buttonPosition
        {
        case 1:
            x = lblPositionSyllable1.frame.origin.x - buttonDisplace.frame.origin.x
            y = lblPositionSyllable1.frame.origin.y - buttonDisplace.frame.origin.y
            
        case 2:
            x = lblPositionSyllable2.frame.origin.x - buttonDisplace.frame.origin.x
            y = lblPositionSyllable2.frame.origin.y - buttonDisplace.frame.origin.y
            
        case 3:
            x = lblPositionSyllable3.frame.origin.x - buttonDisplace.frame.origin.x
            y = lblPositionSyllable3.frame.origin.y - buttonDisplace.frame.origin.y
            
        default:
            println("outro")
        }
        
        UIView.correctAnimation(self.view, buttonAnimate: buttonDisplace, xx: x, yy: y, displacementX: 0)
        
        if acertos == 3
        {
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
            if self.persistence.verifyExistenceOfALevel("gameSyllables", level: self.level)
            {
                self.persistence.updateNumberOfStars("gameSyllables", level: self.level, numberOfStars: self.lifes)
            }
            else
            {
                self.persistence.newScore("gameSyllables", level: self.level, quantityOfStars: self.lifes)
            }
        }
    }

    
    func countError()
    {
        lifes--
        
        if lifes == 0
        {
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("dismiss"), userInfo: nil, repeats: false)
        }
    }
    
    func dismiss()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
        
}
