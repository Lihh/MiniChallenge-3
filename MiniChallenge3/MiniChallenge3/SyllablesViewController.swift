//
//  SyllablesViewController.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 14/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class SyllablesViewController: UIViewController {

    // MARK: - Properties and Outlets
    //================================================================================
    
    // Level
    var level: Int = 0
    
    // Levels Array for images and syllables
    var levels: [( level:Int,    correctWord:String, correctImage:String,
                  image1:String, syllable1:String,   deleteSyllable1:String,
                  image2:String, syllable2:String,   deleteSyllable2:String,
                  image3:String, syllable3:String,   deleteSyllable3:String)]
    
    // TESTE
              = [(1, "JANELA",     "janela.jpg",
                     "jacare.png", "JA", "CARÉ",
                     "neve.png",   "NE", "VE",
                     "lapis.png",  "LA", "PIS")]
    
    // Outlets
    @IBOutlet weak var txtSyllable1: UITextField!
    @IBOutlet weak var txtSyllable2: UITextField!
    @IBOutlet weak var txtSyllable3: UITextField!
    @IBOutlet weak var btnConfirm:   UIButton!
    //================================================================================
    
    
    
    // MARK: - VC Lyfe Cycle
    //================================================================================
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
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

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    //================================================================================

    
    
    // MARK: - Confirm Answers
    //================================================================================
    @IBAction func confirm(sender: AnyObject)
    {
        // Correct Answer
        //-------------------------------------------------
        if (txtSyllable1.text == levels[level].syllable1 &&
            txtSyllable2.text == levels[level].syllable2 &&
            txtSyllable3.text == levels[level].syllable3)
        {
            txtSyllable1.layer.borderColor = UIColor .greenColor().CGColor
            txtSyllable2.layer.borderColor = UIColor .greenColor().CGColor
            txtSyllable3.layer.borderColor = UIColor .greenColor().CGColor
            self.addBlurEffect()
            println("Acertou")
        }
        //-------------------------------------------------
        else
            
        // Wrong Answer
        //-------------------------------------------------
        {
            // Confirm Syllable 1
            if txtSyllable1.text == levels[level].syllable1
            {
                txtSyllable1.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable1.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable1)
            }
            
            // Confirm Syllable 2
            if txtSyllable2.text == levels[level].syllable2
            {
                txtSyllable2.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable2.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable2)
            }
            
            // Confirm Syllable 3
            if txtSyllable3.text == levels[level].syllable3
            {
                txtSyllable3.layer.borderColor = UIColor.greenColor().CGColor
            }
            else
            {
                txtSyllable3.layer.borderColor = UIColor.redColor().CGColor
                wrongAnimation(txtSyllable3)
            }
        }
        //-------------------------------------------------
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
                            println("Errou")
                        })
                    })
                })
        }
    }
    //================================================================================
    
    
    
    // MARK: - Blur Effect
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
