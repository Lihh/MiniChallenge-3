//
//  ModelSyllables.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 22/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ModelSyllables: NSObject
{
    
    static let sharedInstance = ModelSyllables()
    
    func setImageInImageView(imgView: UIImageView, imageName: String)
    {
        var imgAux = NSBundle.mainBundle().pathForResource(imageName, ofType: "png")
        
        imgView.image = UIImage(contentsOfFile: imgAux!)
    }
    
    func setTextInLabel(label: UILabel, labelText: String)
    {
        label.text = labelText
    }
    
    func setTextInButton(button: UIButton, buttonText: String)
    {
        button.setTitle(buttonText, forState: UIControlState.Normal)
    }
    
    func setDisplacementX(button: UIButton,
        destinyPosition: UILabel) -> CGFloat
    {
        return destinyPosition.frame.origin.x - button.frame.origin.x
    }
    
    func setDisplacementY(button: UIButton,
        destinyPosition: UILabel) -> CGFloat
    {
        return destinyPosition.frame.origin.y - button.frame.origin.y
    }
    
    func displaceButton(view: UIView ,button: UIButton, buttonPosition: Int, labelPosition1: UILabel,
        labelPosition2: UILabel, labelPosition3: UILabel)
    {
        var x = CGFloat()
        var y = CGFloat()
        
        switch buttonPosition
        {
        case 1:
            x = labelPosition1.frame.origin.x - button.frame.origin.x
            y = labelPosition1.frame.origin.y - button.frame.origin.y
            
        case 2:
            x = labelPosition2.frame.origin.x - button.frame.origin.x
            y = labelPosition2.frame.origin.y - button.frame.origin.y
            
        case 3:
            x = labelPosition3.frame.origin.x - button.frame.origin.x
            y = labelPosition3.frame.origin.y - button.frame.origin.y
            
        default:
            println("outro")
        }
        
        UIView.correctAnimation(view, buttonAnimate: button, xx: x, yy: y, displacementX: 0)
    }
    
   
}
