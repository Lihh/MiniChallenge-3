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
    
   
}
