//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {
    
    var transition = CircleSegue()
    var toViewController: UIViewController? = nil

    @IBOutlet weak var mathButton: KPButton!
    @IBOutlet weak var portugueseButton: KPButton!
    @IBOutlet weak var scienceButton: KPButton!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var educaLabel: UILabel!
    @IBOutlet weak var plusLabel: UILabel!
    
    var gameSoundBlop = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Blop", ofType: "m4a")!)
    var audioPlayerSound = AVAudioPlayer()
    
    var snap: UISnapBehavior!
    var animator: UIDynamicAnimator!
    var splitVerify = true
    var buttons = [UIButton]()
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.addObserver(self, selector: Selector("dismiss"), name: "backToHome", object: nil)
        navigationController?.navigationBarHidden = true
        
        animator = UIDynamicAnimator(referenceView: mainView)
        buttons = [scienceButton, portugueseButton, mathButton]
        
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            self.buttons[0].alpha = 0
        }, completion: nil)
    }
    
    func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidAppear(animated: Bool) {
        if splitVerify {
            UIView.animateWithDuration(2, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                self.educaLabel.frame = CGRectMake(self.educaLabel.frame.minX, self.view.frame.minY+90, 449, 185)
                self.plusLabel.frame = CGRectMake(self.plusLabel.frame.minX, self.view.frame.minY+42, 97, 185)
            }, completion: { (success) -> Void in
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.buttons[0].alpha = 1
                    }, completion: { (success) -> Void in
                        UIView.animateWithDuration(0.5, animations: { () -> Void in
                            self.buttons[1].alpha = 1
                            }, completion: { (success) -> Void in
                                UIView.animateWithDuration(0.6, animations: { () -> Void in
                                    self.buttons[2].alpha = 1
                                    }, completion: { (success) -> Void in
                                        self.snap = UISnapBehavior(item: self.mathButton, snapToPoint: CGPointMake(self.view.center.x, self.view.center.y-50))
                                        self.animator.addBehavior(self.snap)
                                        self.snap = UISnapBehavior(item: self.portugueseButton, snapToPoint: CGPointMake(self.view.center.x-120, self.view.center.y+120))
                                        self.animator.addBehavior(self.snap)
                                        self.snap = UISnapBehavior(item: self.scienceButton, snapToPoint: CGPointMake(self.view.center.x+120, self.view.center.y+120))
                                        self.animator.addBehavior(self.snap)
                                })
                        })
                })
            })
            splitVerify = false
        }
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        audioPlayerSound = AVAudioPlayer(contentsOfURL: gameSoundBlop, error: nil)
        audioPlayerSound.prepareToPlay()
        audioPlayerSound.play()
        audioPlayerSound.volume = 0.3
        let customSegue: String = segue.identifier!
        
        switch customSegue {
        case "segueOne":
            self.transition.animationChild = mathButton
            self.transition.animationColor = UIColor(red: 201/255, green: 91/255, blue: 90/255, alpha: 1.0)
            toViewController = segue.destinationViewController as! MathViewController
        case "segueTwo":
            self.transition.animationChild = portugueseButton
            self.transition.animationColor = UIColor(red: 117/255, green: 179/255, blue: 214/255, alpha: 1)
            toViewController = segue.destinationViewController as! PortugueseViewController
        case "segueThree":
            self.transition.animationChild = scienceButton
            self.transition.animationColor = UIColor(red: 115/255, green: 195/255, blue: 175/255, alpha: 1.0)
            toViewController = segue.destinationViewController as! ScienceViewController
        default:
            return;
        }
        self.transition.fromViewController = self
        self.transition.toViewController = toViewController
        
        toViewController!.transitioningDelegate = transition
    }

}

