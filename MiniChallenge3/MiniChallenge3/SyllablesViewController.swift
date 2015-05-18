//
//  SyllablesViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 14/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class SyllablesViewController: UIViewController, UITextFieldDelegate {

    // MARK: - Properties and Outlets
    //================================================================================
    
    // Erros
    var erros: Int = 0
    
    // Level
    var level: Int = 3
    
    // Outlets
    @IBOutlet weak var imgImage1: UIImageView!
    @IBOutlet weak var lblDeleteSyllable1: UILabel!
    @IBOutlet weak var txtSyllable1: UITextField!
    
    @IBOutlet weak var imgImage2: UIImageView!
    @IBOutlet weak var lblDeleteSyllable2: UILabel!
    @IBOutlet weak var txtSyllable2: UITextField!
    
    @IBOutlet weak var imgImage3: UIImageView!
    @IBOutlet weak var lblDeleteSyllable3: UILabel!
    @IBOutlet weak var txtSyllable3: UITextField!
    
    @IBOutlet weak var btnConfirm:   UIButton!
    
    // Levels Array for images and syllables
    var levels: [( level:Int,    correctWord:String, correctImage:String,
                  image1:String, syllable1:String,   deleteSyllable1:String,
                  image2:String, syllable2:String,   deleteSyllable2:String,
                  image3:String, syllable3:String,   deleteSyllable3:String)]
    
    // Level 1
    = [(1, "JANELA", "imagem.jpg",
        "CACHORRO", "JA", "CARÉ",
        "CACHORRO",   "NE", "VE",
        "CACHORRO",  "LA", "PIS"),
        
    // Level 2
        (2, "PACOCA", "imagem.jpg",
        "imagem", "PA", "R",
        "imagem", "CO", "CA",
        "imagem", "CA", "O"),
        
    // Level 3
        (2, "MOCHILA", "imagem.jpg",
        "imagem", "MO",  "VEL",
        "imagem", "CHI", "CA",
        "imagem", "LA",  "TA")]
    //================================================================================
    
    
    
    // MARK: - VC Lyfe Cycle
    //================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        gameElementsConfiguration()
        levelConfiguration()
        
        self.txtSyllable1.delegate = self
        self.txtSyllable2.delegate = self
        self.txtSyllable3.delegate = self
    }
    
    override func viewWillAppear(animated: Bool)
    {
        // code
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    //================================================================================
    
    
    
    // MARK: - Game Configuration
    //================================================================================
    func levelConfiguration()
    {
        // Images and Syllables
        var imgAux = NSBundle.mainBundle().pathForResource(levels[level-1].image1, ofType: "png")
        imgImage1.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable1.text = levels[level-1].deleteSyllable1
        
        imgAux = NSBundle.mainBundle().pathForResource(levels[level-1].image2, ofType: "png")
        imgImage2.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable2.text = levels[level-1].deleteSyllable2
        
        imgAux = NSBundle.mainBundle().pathForResource(levels[level-1].image3, ofType: "png")
        imgImage3.image = UIImage(contentsOfFile: imgAux!)
        lblDeleteSyllable3.text = levels[level-1].deleteSyllable3
    }
    
    func gameElementsConfiguration()
    {
        // Border
        txtSyllable1.layer.borderWidth = 2
        txtSyllable2.layer.borderWidth = 2
        txtSyllable3.layer.borderWidth = 2
        btnConfirm.layer.borderWidth = 2
        
        // Border Color
        txtSyllable1.layer.borderColor = UIColor .grayColor().CGColor
        txtSyllable2.layer.borderColor = UIColor .grayColor().CGColor
        txtSyllable3.layer.borderColor = UIColor .grayColor().CGColor
        btnConfirm.layer.borderColor = UIColor .whiteColor().CGColor
        
        // Corner Radius
        txtSyllable1.layer.cornerRadius = 10
        txtSyllable2.layer.cornerRadius = 10
        txtSyllable3.layer.cornerRadius = 10
        btnConfirm.layer.cornerRadius = 20
        
        // Button Color
        btnConfirm.layer.backgroundColor = UIColor .greenColor().CGColor
    }
    //================================================================================
    
    
    
    // MARK: - Confirm Answers
    //================================================================================
    @IBAction func confirm(sender: AnyObject)
    {
        // Correct Answer
        //-------------------------------------------------
        if (txtSyllable1.text == levels[level-1].syllable1 &&
            txtSyllable2.text == levels[level-1].syllable2 &&
            txtSyllable3.text == levels[level-1].syllable3)
        {
            txtSyllable1.layer.borderColor = UIColor .greenColor().CGColor
            txtSyllable2.layer.borderColor = UIColor .greenColor().CGColor
            txtSyllable3.layer.borderColor = UIColor .greenColor().CGColor
            self.addBlurEffect()
            println("Acertou! erros: \(erros)")
        }
        //-------------------------------------------------
        else
            
        // Wrong Answer
        //-------------------------------------------------
        {
            // Confirm Syllable 1
            if txtSyllable1.text == levels[level-1].syllable1
            {
                txtSyllable1.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable1.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable1)
            }
            
            // Confirm Syllable 2
            if txtSyllable2.text == levels[level-1].syllable2
            {
                txtSyllable2.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable2.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable2)
            }
            
            // Confirm Syllable 3
            if txtSyllable3.text == levels[level-1].syllable3
            {
                txtSyllable3.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable3.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable3)
            }
            
            // Somar erro
            erros++
            println("Errou \(erros)x")
        }
        //-------------------------------------------------
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        txtSyllable1.resignFirstResponder()
        txtSyllable2.resignFirstResponder()
        txtSyllable3.resignFirstResponder()
    }
    //================================================================================
    
    
    
    // MARK: - Wrong Answer Animation
    //================================================================================
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
                        })
                    })
                })
        }
    }
    //================================================================================
    
    
    
    // MARK: - Correct Answer
    //================================================================================
    func addBlurEffect()
    {
        var effect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        var effectView = UIVisualEffectView(effect: effect)
        effectView.frame = CGRectMake(0, 0, view.bounds.width, view.bounds.height)
        view.addSubview(effectView)
    }
    //================================================================================
    
}
