//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameAnimalsViewController: UIViewController {

    @IBOutlet weak var buttonNextOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO", "PEIXE", "CAVALO", "COELHO"]
    var level = 0
    var nameAnimal: String!
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var correct = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correct = 3
        notificationCenter.addObserver(self, selector: Selector("getImage:"), name: "CurrentLevel", object: nil)

        buttonNextOutlet.enabled = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage(notification: NSNotification) {
        var currentLevel = notification.userInfo!["title"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        nameAnimal = arrayAnimals[level]
        var var1 = NSBundle.mainBundle().pathForResource(nameAnimal, ofType: "png")
        var img = UIImage(contentsOfFile: var1!)
        imageView.image = img
    }
    
    func wrongAnimation(textFieldAnimate: UITextField)
    {
        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
            textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
            }) { (finished) -> Void in
                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                    textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x-20, 0);
                    }, completion: { (finished) -> Void in
                        UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                            textFieldAnimate.transform = CGAffineTransformMakeTranslation(self.view.frame.origin.x+20, 0);
                            }, completion: { (finished) -> Void in
                                UIView.animateWithDuration(0.1, delay: 0.1, options: UIViewAnimationOptions.CurveEaseIn, animations: { () -> Void in
                                    textFieldAnimate.transform = CGAffineTransformMakeTranslation(0, 0);
                                    }, completion: { (finished) -> Void in
                                        println("Errou")
                                })
                        })
                })
        }
    }

    @IBAction func textFieldAction(sender: UITextField) {
        if textField.text != "" {
            buttonNextOutlet.enabled = true
        } else {
            buttonNextOutlet.enabled = false
        }
    }
    
    @IBAction func buttonNext(sender: AnyObject) {
        var userText = textField.text.uppercaseString
        
        if userText == nameAnimal {
//            UIView.congratulationView(self.view)
            println("Acertou!")
            textField.layer.borderColor = UIColor.greenColor().CGColor
            textField.text = ""
            
            var dictionary = ["Stars" : correct]
            notificationCenter.postNotificationName("QuantityOfStars", object: self, userInfo: dictionary)
            self.dismissViewControllerAnimated(true, completion: {})
        } else {
            if correct == 0 {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            correct--
            println("Errou...")
            textField.text = ""
            textField.layer.borderColor = UIColor.redColor().CGColor
            wrongAnimation(textField)
        }
        
    }
}
