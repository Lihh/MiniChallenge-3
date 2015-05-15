//
//  CompleteTheWordViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 15/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CompleteTheWordViewController: UIViewController {


    @IBOutlet weak var lblWord: UILabel!
    @IBOutlet weak var lblMiss: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor .whiteColor().CGColor
        button1.layer.cornerRadius = 6
        button1.layer.backgroundColor = UIColor.greenColor().CGColor
        
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor .whiteColor().CGColor
        button2.layer.cornerRadius = 6
        button2.layer.backgroundColor = UIColor.greenColor().CGColor
        
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor .whiteColor().CGColor
        button3.layer.cornerRadius = 6
        button3.layer.backgroundColor = UIColor.greenColor().CGColor
        
        button4.layer.borderWidth = 2
        button4.layer.borderColor = UIColor .whiteColor().CGColor
        button4.layer.cornerRadius = 6
        button4.layer.backgroundColor = UIColor.greenColor().CGColor
        
        button5.layer.borderWidth = 2
        button5.layer.borderColor = UIColor .whiteColor().CGColor
        button5.layer.cornerRadius = 6
        button5.layer.backgroundColor = UIColor.greenColor().CGColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    @IBAction func clickButton1(sender: AnyObject)
    {
        println("click 1")
        correctAnimation(button1)
    }
    
    
    @IBAction func clickButton2(sender: AnyObject)
    {
        wrongAnimation(button2)
        println("click 2")
    }
    
    
    @IBAction func clickButton3(sender: AnyObject)
    {
        wrongAnimation(button3)
        println("click 3")
        
    }
    
    @IBAction func clickButton4(sender: AnyObject)
    {
        wrongAnimation(button4)
        println("click 4")
    }
    
    @IBAction func clickButton5(sender: AnyObject)
    {
        wrongAnimation(button5)
        println("click 5")
    }
    
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
                                        self.addBlur(buttonAnimate)
                                })
                        })
                })
        }
    }
    
    func correctAnimation(buttonAnimate: UIButton)
    {
        var missX: CGFloat = self.lblMiss.frame.origin.x
        var missY: CGFloat = self.lblMiss.frame.origin.y
        var letraX: CGFloat = buttonAnimate.frame.origin.x
        var letraY: CGFloat = buttonAnimate.frame.origin.y
        
        var xx = missX - letraX
        var yy = missY - letraY
        
        
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(xx,yy);
            }, completion: { (finished) -> Void in
                buttonAnimate.enabled = false
                //self.addBlurEffect()
        })
    }
    
    func addBlur(buttonBlur: AnyObject)
    {
        // 1
        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Dark)
        // 2
        var blurView = UIVisualEffectView(effect: darkBlur)
        blurView.frame = buttonBlur.bounds
        // 3
        buttonBlur.addSubview(blurView)
    }
    
    // MARK: - Blur Effect
    //================================================================================
    func addBlurEffect()
    {
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        view.addSubview(effectView)
    }
    //================================================================================
}
