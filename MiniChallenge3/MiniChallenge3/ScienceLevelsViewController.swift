//
//  ScienceLevelsViewController.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/15/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ScienceLevelsViewController: UIViewController {
    
    @IBOutlet weak var starsLevelOne: UIImageView!
    @IBOutlet weak var starsLevelTwo: UIImageView!
    @IBOutlet weak var starsLevelThree: UIImageView!
    @IBOutlet weak var starsLevelFour: UIImageView!
    @IBOutlet weak var starsLevelFive: UIImageView!
    @IBOutlet weak var starsLevelSix: UIImageView!
    @IBOutlet weak var starsLevelSeven: UIImageView!
    @IBOutlet weak var starsLevelEight: UIImageView!
    @IBOutlet weak var starsLevelNine: UIImageView!
    
    @IBOutlet weak var buttonLevelOne: KPButton!
    @IBOutlet weak var buttonLevelTwo: KPButton!
    @IBOutlet weak var buttonLevelThree: KPButton!
    @IBOutlet weak var buttonLevelFour: KPButton!
    @IBOutlet weak var buttonLevelFive: KPButton!
    @IBOutlet weak var buttonLevelSix: KPButton!
    @IBOutlet weak var buttonLevelSeven: KPButton!
    @IBOutlet weak var buttonLevelEight: KPButton!
    @IBOutlet weak var buttonLevelNine: KPButton!

    var notificationCenter = NSNotificationCenter.defaultCenter()
    var exercise = ""
    var persistence = Persistence.sharedInstance
    var scores = [Score]()
    var completedLevels = 0
    var buttons = [UIButton]()
    var stars = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [buttonLevelOne, buttonLevelTwo, buttonLevelThree, buttonLevelFour, buttonLevelFive, buttonLevelSix, buttonLevelSeven, buttonLevelEight, buttonLevelNine]
        stars = [starsLevelOne, starsLevelTwo, starsLevelThree, starsLevelFour, starsLevelFive, starsLevelSix, starsLevelSeven, starsLevelEight, starsLevelNine]
        
        var index = 1
        for index; index < stars.count; index++ {
            stars[index].hidden = true
            buttons[index].enabled = false
        }
    }
    
    func discoverExercise(notification: NSNotification) {
        exercise = notification.userInfo!["Exercise"] as! String
    }
    
    override func viewWillAppear(animated: Bool) {
        scores = persistence.findScores(exercise)
        if scores.count != 0 {
            self.configLevels()
        }
    }
    
    @IBAction func transitionToLevel(sender: KPButton) {
        let buttonTitle: AnyObject = sender.currentTitle!
        var dictionary = ["title" : buttonTitle]
        let exerciseStoryboard = UIStoryboard(name: exercise, bundle: nil)
        
        if let viewController = exerciseStoryboard.instantiateInitialViewController() as? UIViewController {
            viewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            presentViewController(viewController, animated: true, completion: nil)
            notificationCenter.postNotificationName("CurrentLevel", object: self, userInfo: dictionary)
        }
    }
    
    func configLevels() {
        var index = 0
        for index; index < scores.count; index++ {
            buttons[index].alpha = 1
            buttons[index].enabled = true
            stars[index].image = self.quantityOfStars(scores[index], index: index)
            stars[index].hidden = false
        }
        
        if index == scores.count {
            self.openNextLevel(index)
        }
    }
    
    @IBAction func backToMainViewController() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func quantityOfStars(score: Score, index: Int) -> UIImage {
        
          let quantity = score.quantityOfStars
            if quantity == 1 {
                let data = NSBundle.mainBundle().pathForResource("OneStarFilled", ofType: "png")
                return UIImage(contentsOfFile: data!)!
            } else if quantity == 2 {
                let data = NSBundle.mainBundle().pathForResource("TwoStarsFilled", ofType: "png")
                return UIImage(contentsOfFile: data!)!
            } else if quantity == 3 {
                let data = NSBundle.mainBundle().pathForResource("ThreeStarsFilled", ofType: "png")
                return UIImage(contentsOfFile: data!)!
            }

        let data = NSBundle.mainBundle().pathForResource("HollowStars", ofType: "png")
        return UIImage(contentsOfFile: data!)!
    }
    
    func openNextLevel(index: Int) {
        buttons[index].alpha = 1
        buttons[index].enabled = true
        stars[index].hidden = false
    }

}
