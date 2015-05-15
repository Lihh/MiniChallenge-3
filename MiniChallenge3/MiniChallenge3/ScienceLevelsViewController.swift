//
//  ScienceLevelsViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ScienceLevelsViewController: UIViewController {

    var notificationCenter = NSNotificationCenter.defaultCenter()
    @IBOutlet weak var starsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: Selector("changeQuantityOfStars:"), name: "QuantityOfStars", object: nil)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func transitionToLevel(sender: KPButton) {
        let buttonTitle: AnyObject = sender.currentTitle!
        var dictionary = ["title" : buttonTitle]
        let exerciseStoryboard = UIStoryboard(name: "Animals", bundle: nil)
        
        if let viewController = exerciseStoryboard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            presentViewController(viewController, animated: true, completion: nil)
            notificationCenter.postNotificationName("CurrentLevel", object: self, userInfo: dictionary)
        }
    }
    
    func changeQuantityOfStars(notification: NSNotification) {
        var stars = notification.userInfo!["Stars"] as! NSNumber
        var quantityOfStars = stars
        
        if quantityOfStars == 3 {
            starsImage.image = UIImage(named: "ThreeStarsFilled")
        } else if quantityOfStars == 2 {
            starsImage.image = UIImage(named: "TwoStarsFilled")
        } else if quantityOfStars == 1 {
            starsImage.image = UIImage(named: "OneStarFilled")
        }
    }

}
