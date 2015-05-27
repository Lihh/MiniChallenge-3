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
        /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
        /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
        /* Image 3  */ "CORACAO", /* Delete */ "RAÇÃO",
        /* Button 1 */ "MA",      /* Delete */ true,  /* Position */ 1,
        /* Button 2 */ "CA",      /* Delete */ true,  /* Position */ 2,
        /* Button 3 */ "CO",      /* Delete */ true,  /* Position */ 3,
        /* Button 4 */ "LO",      /* Delete */ false, /* Position */ 0,
        /* Button 5 */ "VA",      /* Delete */ false, /* Position */ 0,
        /* Button 6 */ "BLA",      /* Delete */ false, /* Position */ 0,
        /* Button 7 */ "TE",      /* Delete */ false, /* Position */ 0,
        /* Button 8 */ "RA",      /* Delete */ false, /* Position */ 0),
    
        // Level 2
        (/* Level */ 2, /* Word */ "TIJOLO", /* Image */ "TIJOLO",
         /* Image 1  */ "TIGRE",   /* Delete */ "GRE",
         /* Image 2  */ "QUEIJO",  /* Delete */ "QUEI",
         /* Image 3  */ "ESQUILO", /* Delete */ "ESQUI",
         /* Button 1 */ "TI", /* Delete */ true,  /* Position */ 1,
         /* Button 2 */ "JO", /* Delete */ true,  /* Position */ 2,
         /* Button 3 */ "LO", /* Delete */ true,  /* Position */ 3,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 3
        (/* Level */ 1, /* Word */ "CAMELO", /* Image */ "CAMELO",
         /* Image 1  */ "CACHORRO", /* Delete */ "CHORRO",
         /* Image 2  */ "MEIA",  /* Delete */ "IA",
         /* Image 3  */ "ESQUILO", /* Delete */ "ESQUI",
         /* Button 1 */ "CA", /* Delete */ true, /* Position */ 1,
         /* Button 2 */ "ME", /* Delete */ true, /* Position */ 2,
         /* Button 3 */ "LO", /* Delete */ true, /* Position */ 3,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 4
        (/* Level */ 1, /* Word */ "PANELA", /* Image */ "PANELA",
         /* Image 1  */ "PASSARO", /* Delete */ "SSARO",
         /* Image 2  */ "NEVE",  /* Delete */ "VE",
         /* Image 3  */ "LAPIS", /* Delete */ "PIS",
         /* Button 1 */ "PA", /* Delete */ true, /* Position */ 1,
         /* Button 2 */ "NE", /* Delete */ true, /* Position */ 2,
         /* Button 3 */ "LA", /* Delete */ true, /* Position */ 3,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 5
        (/* Level */ 1, /* Word */ "BOLACHA", /* Image */ "BOLACHA",
         /* Image 1  */ "BOLA", /* Delete */ "LA",
         /* Image 2  */ "LAPIS",  /* Delete */ "PIS",
         /* Image 3  */ "CHAPEU", /* Delete */ "PÉU",
         /* Button 1 */ "BO", /* Delete */ true, /* Position */ 1,
         /* Button 2 */ "LA", /* Delete */ true, /* Position */ 2,
         /* Button 3 */ "CHA", /* Delete */ true, /* Position */ 3,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 6
        (/* Level */ 1, /* Word */ "PEGADA", /* Image */ "PEGADA",
         /* Image 1  */ "PEIXE", /* Delete */ "IXE",
         /* Image 2  */ "GATO",  /* Delete */ "TO",
         /* Image 3  */ "LAMPADA", /* Delete */ "LAMPA",
         /* Button 1 */ "PE", /* Delete */ true, /* Position */ 1,
         /* Button 2 */ "GA", /* Delete */ true, /* Position */ 2,
         /* Button 3 */ "DA", /* Delete */ true, /* Position */ 3,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 7
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "XXX", /* Delete */ "RACAO",
         /* Button 1 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 8
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "XXX", /* Delete */ "RACAO",
         /* Button 1 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),
    
        // Level 9
        (/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
         /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
         /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
         /* Image 3  */ "XXX", /* Delete */ "RACAO",
         /* Button 1 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 2 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 3 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 4 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 5 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 6 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 7 */ "XXX", /* Delete */ false, /* Position */ 0,
         /* Button 8 */ "XXX", /* Delete */ false, /* Position */ 0),]
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
        if level == 0
        {
            tutorialHand.hidden = false
            syllable.showTutorial(self.view, hand: tutorialHand, destiny1: lblPositionSyllable1, destiny2: btnOption1)
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
        // Tutorial
        tutorialHand.hidden = true
        
        // Images
        syllable.setImageInImageView(imgImage1, imageName: levels[level].image1)
        syllable.setImageInImageView(imgImage2, imageName: levels[level].image2)
        syllable.setImageInImageView(imgImage3, imageName: levels[level].image3)
        
        // Labels
        syllable.setTextInLabel(lblDeleteSyllable1, labelText: levels[level].deleteSyllable1)
        syllable.setTextInLabel(lblDeleteSyllable2, labelText: levels[level].deleteSyllable2)
        syllable.setTextInLabel(lblDeleteSyllable3, labelText: levels[level].deleteSyllable3)
        
        // Buttons
        syllable.setTextInButton(btnOption1, buttonText: levels[level].button1Text)
        syllable.setTextInButton(btnOption2, buttonText: levels[level].button2Text)
        syllable.setTextInButton(btnOption3, buttonText: levels[level].button3Text)
        syllable.setTextInButton(btnOption4, buttonText: levels[level].button4Text)
        syllable.setTextInButton(btnOption5, buttonText: levels[level].button5Text)
        syllable.setTextInButton(btnOption6, buttonText: levels[level].button6Text)
        syllable.setTextInButton(btnOption7, buttonText: levels[level].button7Text)
        syllable.setTextInButton(btnOption8, buttonText: levels[level].button8Text)
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
            { rightButton(btnOption1, buttonPosition: levels[level].Button1Position) }
            else
            { wrongButton(btnOption1) }
            
        case 2:
            if levels[level].button2Correct == true
            { rightButton(btnOption2, buttonPosition: levels[level].Button2Position) }
            else
            { wrongButton(btnOption2) }
            
        case 3:
            if levels[level].button1Correct == true
            { rightButton(btnOption3, buttonPosition: levels[level].Button3Position) }
            else
            { wrongButton(btnOption3) }
            
        case 4:
            if levels[level].button4Correct == true
            { rightButton(btnOption4, buttonPosition: levels[level].Button4Position) }
            else
            { wrongButton(btnOption4) }
            
        case 5:
            if levels[level].button5Correct == true
            { rightButton(btnOption5, buttonPosition: levels[level].Button5Position) }
            else
            { wrongButton(btnOption5) }
            
        case 6:
            if levels[level].button6Correct == true
            { rightButton(btnOption6, buttonPosition: levels[level].Button6Position) }
            else
            { wrongButton(btnOption6) }
            
        case 7:
            if levels[level].button7Correct == true
            { rightButton(btnOption7, buttonPosition: levels[level].Button7Position)
            }
            else { wrongButton(btnOption7) }
            
        case 8:
            if levels[level].button8Correct == true
            { rightButton(btnOption8, buttonPosition: levels[level].Button8Position)
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
            var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("dismissView"), userInfo: nil, repeats: false)
            
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
        UIView.wrongAnimation(self.view, buttonAnimate: button)
        
        // Lifes --
        lifes--
        
        // Game Over
        if lifes == 0
        { var timer = NSTimer.scheduledTimerWithTimeInterval(1.5, target: self, selector: Selector("dismissView"), userInfo: nil, repeats: false) }
    }
    //================================================================================
    
    
    
    // MARK: - Exit Game
    //================================================================================
    @IBAction func btnBack(sender: KPButton)
    { self.dismissViewControllerAnimated(true, completion: nil) }
    
    func dismissView()
    { self.dismissViewControllerAnimated(true, completion: nil) }
    //================================================================================
    
}
