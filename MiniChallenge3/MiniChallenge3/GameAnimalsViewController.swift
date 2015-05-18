//
//  GameAnimalsViewController.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/14/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class GameAnimalsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buttonNextOutlet: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO", "PEIXE", "CAVALO"]
    var level = 0
    var nameAnimal: String!
    var notificationCenter = NSNotificationCenter.defaultCenter()
    var correct = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correct = 3
        notificationCenter.addObserver(self, selector: Selector("getImage:"), name: "CurrentLevel", object: nil)

        buttonNextOutlet.enabled = false
        
        self.textField.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
            if correct == 1 {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            correct--
            println("Errou...")
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
