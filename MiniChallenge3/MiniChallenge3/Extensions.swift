//
//  Extensions.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

extension UIView {
    static func congratulationView(view: UIView) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width, view.frame.height)
        view.addSubview(blurView)
        
        let exerciseStoryboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let viewController = exerciseStoryboard.instantiateViewControllerWithIdentifier("CongratulationsView") as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            viewController.view.center = view.center
            view.addSubview(viewController.view)
        }
        
//        let congratulationsView = UIView(frame: CGRectMake(blurView.frame.midX-200, blurView.frame.midY-100, 400.0, 200.0))
//        congratulationsView.backgroundColor = UIColor.redColor()
//        blurView.addSubview(congratulationsView)
//        
//        let congratulationsLabel = UILabel(frame: CGRectMake(view.frame.midX-75, view.frame.midY-80, 150.0, 40.0))
//        congratulationsLabel.font = UIFont(name: "BloggerSans-Light", size: 40.0)
//        congratulationsLabel.text = "Parabéns"
//        view.addSubview(congratulationsLabel)
//        
//        let starsImage = UIImageView(frame: CGRectMake(view.frame.midX-50, view.frame.midY-35, 100.0, 30.0))
//        starsImage.image = UIImage(named: "ThreeStarsFilled")
//        view.addSubview(starsImage)
    }
    
    static func wrongAnimation(view: UIView, buttonAnimate: UIButton) {
        
        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(view.frame.origin.x+20, 0);
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    buttonAnimate.transform = CGAffineTransformMakeTranslation(view.frame.origin.x-20, 0);
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            buttonAnimate.transform = CGAffineTransformMakeTranslation(view.frame.origin.x+20, 0);
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    buttonAnimate.transform = CGAffineTransformMakeTranslation(0, 0);
                                    }, completion: { (finished) -> Void in
                                        buttonAnimate.setImage(nil, forState: UIControlState.Normal)
                                        buttonAnimate.backgroundColor = UIColor .whiteColor()
                                        buttonAnimate.enabled = false
                                        buttonAnimate.setTitle("X", forState: UIControlState.Normal)
                                        buttonAnimate.setTitleColor(UIColor .redColor(), forState: UIControlState.Normal)
                                })
                        })
                })
        }

    }
    
    static func correctAnimation(view: UIView, buttonAnimate: UIButton, xx: CGFloat, yy: CGFloat, displacementX: CGFloat) {
        
        
        UIView.animateWithDuration(0.4, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            buttonAnimate.transform = CGAffineTransformMakeTranslation(xx,yy);
            buttonAnimate.enabled = false
            buttonAnimate.borderWidth = 0
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 2, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    }, completion: { (finished) -> Void in

                })
        }
        
    }
    
    
    static func setDisplacementX(button: UIButton,
        destinyPosition: AnyObject) -> CGFloat
    {
        return destinyPosition.frame.origin.x - button.frame.origin.x
    }
    
    static func setDisplacementY(button: UIButton,
        destinyPosition: AnyObject) -> CGFloat
    {
        return destinyPosition.frame.origin.y - button.frame.origin.y
    }
    
    static func tutorialAnimation(hand:UIButton, destiny:AnyObject, x:CGFloat, y:CGFloat)
    {
        var x = self.setDisplacementX(hand, destinyPosition: destiny) + x
        var y = self.setDisplacementY(hand, destinyPosition: destiny) + y
        hand.transform = CGAffineTransformMakeTranslation(x,y);
    }
    
    static func showTutorial(view:UIView, hand:UIButton, destiny1:UILabel, x1:CGFloat, y1:CGFloat, destiny2:UIButton, x2:CGFloat, y2:CGFloat)
    {
        UIView.animateWithDuration(1,delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.tutorialAnimation(hand, destiny: destiny1, x: x1, y: y1)
            }) { (finished) -> Void in
                UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    destiny1.borderColor = UIColor.yellowColor()
                    println("hand x: \(hand.frame.origin.x)")
                    println("hand y: \(hand.frame.origin.y)")
                    println("lbl x: \(destiny1.frame.origin.x)")
                    println("lbl y: \(destiny1.frame.origin.y)\n\n")
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            self.tutorialAnimation(hand, destiny: destiny2, x: x2, y: y2)
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
    
   
}
