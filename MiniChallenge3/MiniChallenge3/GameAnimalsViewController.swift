//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameAnimalsViewController: UIViewController {

    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var buttonNextOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO", "PEIXE", "CAVALO", "COELHO"]
    var level = 0
    var nameAnimal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImage(level)

        buttonNextOutlet.enabled = false
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor .grayColor().CGColor
        textField.layer.cornerRadius = 10
        
        buttonNextOutlet.layer.borderColor = UIColor .whiteColor().CGColor
        buttonNextOutlet.layer.cornerRadius = 20
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getImage(number: Int) {
        nameAnimal = arrayAnimals[number]
        var var1 = NSBundle.mainBundle().pathForResource("\(nameAnimal)", ofType: "png")
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
            UIView.congratulationView(self.view)
            println("Acertou!")
            textField.layer.borderColor = UIColor.greenColor().CGColor
            textField.text = ""
            //self.dismissViewControllerAnimated(true, completion: {})
        } else {
            println("Errou...")
            textField.text = ""
            textField.layer.borderColor = UIColor.redColor().CGColor
            wrongAnimation(textField)
        }
        
    }
}
