//
//  ModelSyllables.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 22/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ModelSyllables: NSObject
{
    // Singleton
    static let sharedInstance = ModelSyllables()
    
    
    
    // Game Configuration
    //================================================================================
    func setImageInImageView(imgView: UIImageView, imageName: String)
    {
        var imgAux = NSBundle.mainBundle().pathForResource(imageName, ofType: "png")
        
        imgView.image = UIImage(contentsOfFile: imgAux!)
    }
    
    func setTextInLabel(label: UILabel, labelText: String)
    {
        label.text = labelText
    }
    
    func setTextInButton(button: UIButton, buttonText: String)
    {
        button.setTitle(buttonText, forState: UIControlState.Normal)
    }
    //================================================================================
    
    
    
    // Animation
    //================================================================================
    func setDisplacementX(button: UIButton,
        destinyPosition: AnyObject) -> CGFloat
    {
        return destinyPosition.frame.origin.x - button.frame.origin.x
    }
    
    func setDisplacementY(button: UIButton,
        destinyPosition: AnyObject) -> CGFloat
    {
        return destinyPosition.frame.origin.y - button.frame.origin.y
    }
    
    func displaceButton(view: UIView ,button: UIButton, buttonPosition: Int, labelPosition1: UILabel,
        labelPosition2: UILabel, labelPosition3: UILabel)
    {
        var x = CGFloat()
        var y = CGFloat()
        
        switch buttonPosition
        {
        case 1:
            x = labelPosition1.frame.origin.x - button.frame.origin.x
            y = labelPosition1.frame.origin.y - button.frame.origin.y
            
        case 2:
            x = labelPosition2.frame.origin.x - button.frame.origin.x
            y = labelPosition2.frame.origin.y - button.frame.origin.y
            
        case 3:
            x = labelPosition3.frame.origin.x - button.frame.origin.x
            y = labelPosition3.frame.origin.y - button.frame.origin.y
            
        default:
            println("outro")
        }
        
        UIView.correctAnimation(view, buttonAnimate: button, xx: x, yy: y, displacementX: 0)
    }
    //================================================================================
    
    
    
    // Tutorial Animation
    //================================================================================
    func tutorialAnimation(hand:UIButton, destiny:AnyObject, x:CGFloat, y:CGFloat)
    {
        var x = self.setDisplacementX(hand, destinyPosition: destiny) + x // - 50
        var y = self.setDisplacementY(hand, destinyPosition: destiny) + y// + 20
        hand.transform = CGAffineTransformMakeTranslation(x,y);
    }
    //================================================================================
    
    
    
    // Tutorial
    //================================================================================
    func showTutorial(view:UIView, hand:UIButton, destiny1:UILabel, x1:CGFloat, y1:CGFloat, destiny2:UIButton, x2:CGFloat, y2:CGFloat)
    {
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.tutorialAnimation(hand, destiny: destiny1, x: x1, y: y1) // -50 20
            }) { (finished) -> Void in
                UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    destiny1.borderColor = UIColor.yellowColor()
                    println("hand x: \(hand.frame.origin.x)")
                    println("hand y: \(hand.frame.origin.y)")
                    println("lbl x: \(destiny1.frame.origin.x)")
                    println("lbl y: \(destiny1.frame.origin.y)\n\n")
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            self.tutorialAnimation(hand, destiny: destiny2, x: x2, y: y2) // 370 15
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    destiny2.borderColor = UIColor.yellowColor()
                                    println("hand x: \(hand.frame.origin.x)")
                                    println("hand y: \(hand.frame.origin.y)")
                                    println("btn x: \(destiny2.frame.origin.x)")
                                    println("btn y: \(destiny2.frame.origin.y)\n\n")
                                    }, completion: { (finished) -> Void in
                                })
                        })
                })
        }
        
    }
    //================================================================================
    
    
}
