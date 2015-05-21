//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameAnimalsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO", "PEIXE", "CAVALO"]
    var level = 0
    var nameAnimal: String!
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var lifes = 3
    let persistence = Persistence.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: Selector("getImage:"), name: "CurrentLevelScienceExercise", object: nil)

        confirmButton.enabled = false
        
        self.textField.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func getImage(notification: NSNotification) {
        var currentLevel = notification.userInfo!["level"] as! String
        level = currentLevel.toInt()!
        level = level - 1
        
        nameAnimal = arrayAnimals[level]
        var var1 = NSBundle.mainBundle().pathForResource(nameAnimal, ofType: "png")
        var img = UIImage(contentsOfFile: var1!)
        imageView.image = img
    }

    @IBAction func textFieldAction(sender: UITextField) {
        if textField.text != "" {
            confirmButton.enabled = true
        } else {
            confirmButton.enabled = false
        }
        
    }
    
    @IBAction func ConfirmButton() {
        var userText = textField.text.uppercaseString
        
        if userText == nameAnimal {
            UIView.congratulationView(self.view)
            textField.layer.borderColor = UIColor.greenColor().CGColor
            textField.text = ""
            
            if persistence.verifyExistenceOfALevel("Animals", level: level) {
                persistence.updateNumberOfStars("Animals", level: level, numberOfStars: lifes)
            } else {
                persistence.newScore("Animals", level: level, quantityOfStars: lifes)
            }
            self.dismissViewControllerAnimated(true, completion: nil)
            
        } else {
            if lifes == 1 {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            lifes--
            textField.text = ""
            textField.layer.borderColor = UIColor.redColor().CGColor
            UIView.wrongAnimation(self.view, textFieldAnimate: textField)
        }
        
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        textField.resignFirstResponder()
    }
    
    @IBAction func buttonBack(sender: KPButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
