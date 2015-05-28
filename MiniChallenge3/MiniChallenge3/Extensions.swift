//
//  Extensions.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

extension UIView {
    static func congratulationView(view: UIView, viewController: UIViewController) {
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.width, view.frame.height)
        view.addSubview(blurView)
        
        let congratulationsView = UIView(frame: CGRectMake(blurView.frame.midX-225, blurView.frame.midY-150, 450.0, 300.0))
        congratulationsView.backgroundColor = UIColor.redColor()
        congratulationsView.clipsToBounds = true
        congratulationsView.cornerRadius = 10
        blurView.addSubview(congratulationsView)
        
        let congratulationsLabel = UILabel(frame: CGRectMake(view.frame.midX-75, view.frame.midY-130, 150.0, 40.0))
        congratulationsLabel.font = UIFont(name: "BloggerSans-Light", size: 40.0)
        congratulationsLabel.text = "Parabéns"
        view.addSubview(congratulationsLabel)
        
        let starsImage = UIImageView(frame: CGRectMake(view.frame.midX-65, view.frame.midY-75, 130.0, 40.0))
        starsImage.image = UIImage(named: "ThreeStarsFilled")
        view.addSubview(starsImage)
        
        let buttonHome = UIButton(frame: CGRectMake(view.frame.midX-50, view.frame.midY+30, 100, 100))
        buttonHome.clipsToBounds = true
        buttonHome.cornerRadius = 50
        buttonHome.backgroundColor = UIColor.yellowColor()
        view.addSubview(buttonHome)
        
        let buttonBack = UIButton(frame: CGRectMake(view.frame.midX-200, view.frame.midY+30, 100, 100))
        buttonBack.clipsToBounds = true
        buttonBack.cornerRadius = 50
        buttonBack.backgroundColor = UIColor.yellowColor()
        view.addSubview(buttonBack)
        
        let buttonNext = UIButton(frame: CGRectMake(view.frame.midX+100, view.frame.midY+30, 100, 100))
        buttonNext.clipsToBounds = true
        buttonNext.cornerRadius = 50
        buttonNext.backgroundColor = UIColor.yellowColor()
        view.addSubview(buttonNext)
        
        
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
}
