//
//  CountingViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 18/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CountingViewController: UIViewController {

    // MARK: - Properties and Outlets
    //================================================================================
    
    // Erros
    var errors: Int = 0
    
    // Level
    var level: Int = 1
    
    // Finish - Number of correct buttons
    var finish: Int = 0
    
    // Outlets
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button10: UIButton!
    @IBOutlet weak var button11: UIButton!
    @IBOutlet weak var button12: UIButton!
    @IBOutlet weak var button13: UIButton!
    @IBOutlet weak var button14: UIButton!
    @IBOutlet weak var button15: UIButton!
    @IBOutlet weak var button16: UIButton!
    @IBOutlet weak var button17: UIButton!
    @IBOutlet weak var button18: UIButton!
    @IBOutlet weak var button19: UIButton!
    @IBOutlet weak var button20: UIButton!
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var btnOption1: UIButton!
    @IBOutlet weak var btnOption2: UIButton!
    @IBOutlet weak var btnOption3: UIButton!
    @IBOutlet weak var btnOption4: UIButton!
    
    // Levels Array
    var levels:[(level:Int, gameTitle:String, finish:Int, question:String, correctImage:String, wrongImage:String,
                 button1Correct:Bool, button2Correct:Bool, button3Correct:Bool, button4Correct:Bool, button5Correct:Bool, button6Correct:Bool, button7Correct:Bool, button8Correct:Bool,
    button9Correct:Bool, button10Correct:Bool, button11Correct:Bool, button12Correct:Bool, button13Correct:Bool, button14Correct:Bool, button15Correct:Bool, button16Correct:Bool,
    button17Correct:Bool, button18Correct:Bool, button19Correct:Bool, button20Correct:Bool,
    option1Correct:Bool, option1Text:String, option2Correct:Bool, option2Text:String, option3Correct:Bool, option3Text:String, option4Correct:Bool, option4Text:String)]
    
    // Level 1
    = [(1, "CLIQUE NOS PASSAROS", 5, "QUANTOS PASSAROS ?", "PASSARO", "CACHORRO",
        true, false, false, false, false, true, false, false,
        false, false, true, false, false, false, false, true,
        false, false, false, true,
        false, "2", false, "3", false, "4", true, "5")]
    
    //================================================================================
    
    
    
    // MARK: - VC Lyfe Cycle
    //================================================================================
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
    //================================================================================
    
    
    func levelConfiguration()
    {
        lblTitle.text = levels[level-1].gameTitle
        lblQuestion.text = levels[level-1].question
        lblQuestion.hidden = true
        
        btnOption1.setTitle(levels[level-1].option1Text, forState: UIControlState.Normal)
        btnOption2.setTitle(levels[level-1].option2Text, forState: UIControlState.Normal)
        btnOption3.setTitle(levels[level-1].option3Text, forState: UIControlState.Normal)
        btnOption4.setTitle(levels[level-1].option4Text, forState: UIControlState.Normal)
        
        btnOption1.hidden = true
        btnOption2.hidden = true
        btnOption3.hidden = true
        btnOption4.hidden = true
    }
    
    func buttonsConfiguration()
    {
        // Set Image
        var imgAuxCorrect = NSBundle.mainBundle().pathForResource(levels[level-1].correctImage, ofType: "png")
        var imgAuxWrong = NSBundle.mainBundle().pathForResource(levels[level-1].wrongImage, ofType: "png")
        
        if levels[level-1].button1Correct == true
        { button1.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button1.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button2Correct == true
        { button2.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button2.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button3Correct == true
        { button3.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button3.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button4Correct == true
        { button4.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button4.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button5Correct == true
        { button5.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button5.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button6Correct == true
        { button6.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button6.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button7Correct == true
        { button7.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button7.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button8Correct == true
        { button8.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button8.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button9Correct == true
        { button9.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button9.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button10Correct == true
        { button10.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button10.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button11Correct == true
        { button11.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button11.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button12Correct == true
        { button12.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button12.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button13Correct == true
        { button13.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button13.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button14Correct == true
        { button14.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button14.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button15Correct == true
        { button15.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button15.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button16Correct == true
        { button16.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button16.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button17Correct == true
        { button17.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button17.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button18Correct == true
        { button18.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button18.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button19Correct == true
        { button19.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button19.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
        
        if levels[level-1].button20Correct == true
        { button20.setImage(UIImage(contentsOfFile: imgAuxCorrect!), forState: UIControlState.Normal) }
        else
        { button20.setImage(UIImage(contentsOfFile: imgAuxWrong!), forState: UIControlState.Normal) }
    }
    
    
    // MARK: - Button Click
    //================================================================================
    @IBAction func buttonClick(sender: AnyObject)
    {
        switch sender.tag
        {
        case 1:
            if levels[level-1].button1Correct == true
            { correctAnimation(button1) }
            else
            { wrongAnimation(button1) }
            
        case 2:
            if levels[level-1].button2Correct == true
            { correctAnimation(button2) }
            else
            { wrongAnimation(button2) }
            
        case 3:
            if levels[level-1].button3Correct == true
            { correctAnimation(button3) }
            else
            { wrongAnimation(button3) }
            
        case 4:
            if levels[level-1].button4Correct == true
            { correctAnimation(button4) }
            else
            { wrongAnimation(button4) }
            
        case 5:
            if levels[level-1].button5Correct == true
            { correctAnimation(button5) }
            else
            { wrongAnimation(button5) }
            
        case 6:
            if levels[level-1].button6Correct == true
            { correctAnimation(button6) }
            else
            { wrongAnimation(button6) }
            
        case 7:
            if levels[level-1].button7Correct == true
            { correctAnimation(button7) }
            else
            { wrongAnimation(button7) }
            
        case 8:
            if levels[level-1].button8Correct == true
            { correctAnimation(button8) }
            else
            { wrongAnimation(button8) }
            
        case 9:
            if levels[level-1].button9Correct == true
            { correctAnimation(button9) }
            else
            { wrongAnimation(button9) }
            
        case 10:
            if levels[level-1].button10Correct == true
            { correctAnimation(button10) }
            else
            { wrongAnimation(button10) }
            
        case 11:
            if levels[level-1].button11Correct == true
            { correctAnimation(button11) }
            else
            { wrongAnimation(button11) }
            
        case 12:
            if levels[level-1].button12Correct == true
            { correctAnimation(button12) }
            else
            { wrongAnimation(button12) }
            
        case 13:
            if levels[level-1].button13Correct == true
            { correctAnimation(button13) }
            else
            { wrongAnimation(button13) }
            
        case 14:
            if levels[level-1].button14Correct == true
            { correctAnimation(button14) }
            else
            { wrongAnimation(button14) }
            
        case 15:
            if levels[level-1].button15Correct == true
            { correctAnimation(button15) }
            else
            { wrongAnimation(button15) }
            
        case 16:
            if levels[level-1].button16Correct == true
            { correctAnimation(button16) }
            else
            { wrongAnimation(button16) }
            
        case 17:
            if levels[level-1].button17Correct == true
            { correctAnimation(button17) }
            else
            { wrongAnimation(button17) }
            
        case 18:
            if levels[level-1].button18Correct == true
            { correctAnimation(button18) }
            else
            { wrongAnimation(button18) }
            
        case 19:
            if levels[level-1].button19Correct == true
            { correctAnimation(button19) }
            else
            { wrongAnimation(button19) }
            
        case 20:
            if levels[level-1].button20Correct == true
            { correctAnimation(button20) }
            else
            { wrongAnimation(button20) }
            
        case 21:
            if levels[level-1].option1Correct == true
            { correctAnimation(btnOption1) }
            else
            { wrongAnimation(btnOption1) }
            
        case 22:
            if levels[level-1].option2Correct == true
            { correctAnimation(btnOption2) }
            else
            { wrongAnimation(btnOption2) }
            
        case 23:
            if levels[level-1].option3Correct == true
            { correctAnimation(btnOption3) }
            else
            { wrongAnimation(btnOption3) }
            
        case 24:
            if levels[level-1].option4Correct == true
            { correctAnimation(btnOption4) }
            else
            { wrongAnimation(btnOption4) }
            
        default:
            println("outro")
        }
    }
    //================================================================================
    
    
    
    // MARK: - Animation for Wrong Button
    //============================================================
    func wrongAnimation(buttonAnimate: UIButton)
    {
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
                                        buttonAnimate.backgroundColor = UIColor.redColor()
                                        buttonAnimate.enabled = false
                                })
                        })
                })
        }
        errors++
        println("Errou \(errors)x")
    }
    //============================================================
    
    
    
    // MARK: - Animation for Correct Button
    //============================================================
    func correctAnimation(buttonAnimate: UIButton)
    {
        finish++
        println("Acertou")
        
        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+15);
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    buttonAnimate.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y-15);
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            buttonAnimate.transform = CGAffineTransformMakeTranslation(0, self.view.frame.origin.y+15);
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    buttonAnimate.transform = CGAffineTransformMakeTranslation(0, 0);
                                    }, completion: { (finished) -> Void in
                                        buttonAnimate.backgroundColor = UIColor.greenColor()
                                        buttonAnimate.enabled = false
                                        if self.finish == 5 { self.showQuestion() }
                                })
                        })
                })
        }
        
        if finish >= levels[level-1].finish
        { println("\n\nGanhou!!") }
    }
    
    
    func showQuestion()
    {
        button1.enabled = false
        button2.enabled = false
        button3.enabled = false
        button4.enabled = false
        button5.enabled = false
        button6.enabled = false
        button7.enabled = false
        button8.enabled = false
        button9.enabled = false
        button10.enabled = false
        button11.enabled = false
        button12.enabled = false
        button13.enabled = false
        button14.enabled = false
        button15.enabled = false
        button16.enabled = false
        button17.enabled = false
        button18.enabled = false
        button19.enabled = false
        button20.enabled = false
        
        lblQuestion.hidden = false
        btnOption1.hidden = false
        btnOption2.hidden = false
        btnOption3.hidden = false
        btnOption4.hidden = false
    }
    //============================================================
    
}
