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
    let arrayAnimals = ["CACHORRO", "GATO", "PASSARO"]
    var numAnimal = 0
    var nameAnimal: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getImage(numAnimal)

        buttonNextOutlet.enabled = false
        
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
    
    func changeAnimal(){
        if numAnimal < 2 {
            numAnimal += 1
        } else {
            numAnimal = 0
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
            println("Acertou!")
            textField.text = ""
            changeAnimal()
            self.viewDidLoad()
        } else {
            println("Errou...")
            textField.text = ""
        }
        
    }
}
