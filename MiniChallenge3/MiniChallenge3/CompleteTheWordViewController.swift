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
    var level: Int! = 3
    
    // Erros
    var errors: Int = 0
    
    // Finish - Number of correct buttons
    var finish: Int = 0
    
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
    = [(1, "CACHORRO", "C _ S A", 1,
       "A", true, 1, "B", false, 0, "C", false, 0, "D", false, 0, "E", false, 0),
    
    // Level 2
       (2, "CACHORRO", "S _ _ A T _", 3,
       "A", true, 1, "F", false, 0, "P", true, 2, "E", false, 0, "O", true, 5),
        
    // Level 3
       (3, "CACHORRO", "P _ P _ C _", 3,
       "A", true, 5, "E", false, 0, "I", true, 1, "O", true, 3, "U", false, 0)]
    //============================================================
    
    
    
    // MARK: - VC Life Cycle
    //============================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        levelConfiguration()
        buttonsConfiguration()
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
    func levelConfiguration()
    {
        // Set Image
        var imgAux = NSBundle.mainBundle().pathForResource(levels[level-1].wordImage, ofType: "png")
        imgImage.image = UIImage(contentsOfFile: imgAux!)
        
        // Set Incomplete Word
        lblWord.text = levels[level-1].incompleteWord
    }
    
    func buttonsConfiguration()
    {
        button1.setTitle(levels[level-1].button1Text, forState: UIControlState.Normal)
        button1.layer.cornerRadius = 6
        button1.layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        button2.setTitle(levels[level-1].button2Text, forState: UIControlState.Normal)
        button2.layer.cornerRadius = 6
        button2.layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        button3.setTitle(levels[level-1].button3Text, forState: UIControlState.Normal)
        button3.layer.cornerRadius = 6
        button3.layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        button4.setTitle(levels[level-1].button4Text, forState: UIControlState.Normal)
        button4.layer.cornerRadius = 6
        button4.layer.backgroundColor = UIColor.lightGrayColor().CGColor
        
        button5.setTitle(levels[level-1].button5Text, forState: UIControlState.Normal)
        button5.layer.cornerRadius = 6
        button5.layer.backgroundColor = UIColor.lightGrayColor().CGColor
    }
    //============================================================
    
    
    
    // MARK: - Buttons Click
    //============================================================
    
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if levels[level-1].button1Correct == true
            { correctAnimation(button1, displacementX: levels[level-1].button1Displacement) }
            else
            { wrongAnimation(button1) }
            
        case 2:
            if levels[level-1].button2Correct == true
            { correctAnimation(button2, displacementX: levels[level-1].button2Displacement) }
            else
            { wrongAnimation(button2) }
            
        case 3:
            if levels[level-1].button3Correct == true
            { correctAnimation(button3, displacementX: levels[level-1].button3Displacement) }
            else
            { wrongAnimation(button3) }
            
        case 4:
            if levels[level-1].button4Correct == true
            { correctAnimation(button4, displacementX: levels[level-1].button4Displacement) }
            else
            { wrongAnimation(button4) }
            
        case 5:
            if levels[level-1].button5Correct == true
            { correctAnimation(button5, displacementX: levels[level-1].button5Displacement) }
            else
            { wrongAnimation(button5) }
            
        default:
            println("outro")
        }
    }
    //============================================================
    
    
    
    // MARK: - Animation for Wrong Button
    //============================================================
    func wrongAnimation(buttonAnimate: UIButton)
    {
        buttonAnimate.backgroundColor = UIColor.redColor()
        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+15, 0);
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    buttonAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x-15, 0);
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            buttonAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+15, 0);
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    buttonAnimate.transform = CGAffineTransformMakeTranslation(0, 0);
                                    }, completion: { (finished) -> Void in
                                        self.addButtonBlurEfect(buttonAnimate)
                                })
                        })
                })
        }
        errors++
        println("Errou \(errors)x")
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
    func correctAnimation(buttonAnimate: UIButton, displacementX: CGFloat)
    {
        finish++
        println("Acertou!")
        
        // Set the Displacement of Button
        var xx = self.lblWord.frame.origin.x - buttonAnimate.frame.origin.x
        xx = xx + (48 * displacementX)
        var yy = self.lblWord.frame.origin.y - buttonAnimate.frame.origin.y
        
        // Animation
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(xx,yy);
            buttonAnimate.enabled = false
            buttonAnimate.backgroundColor = UIColor.whiteColor()
            buttonAnimate.borderWidth = 0
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    if self.finish == self.levels[self.level-1].finish
                    {
                        self.addViewBlurEffect()
                        println("Ganhou! \(self.errors) erros")
                    }
                    }, completion: { (finished) -> Void in
                })
        }
    }
    
    func addViewBlurEffect()
    {
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        view.addSubview(effectView)
    }
    //============================================================

}
