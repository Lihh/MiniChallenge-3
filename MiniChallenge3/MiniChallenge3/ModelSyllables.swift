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
    // Singleton
    static let sharedInstance = ModelSyllables()
    
    // Levels Array for images and syllables
    var levels: [( level:Int,    correctWord:String, correctImage:String,
    image1:String, deleteSyllable1:String,
    image2:String, deleteSyllable2:String,
    image3:String, deleteSyllable3:String,
    button1Text:String, button1Correct:Bool, Button1Position:Int,
    button2Text:String, button2Correct:Bool, Button2Position:Int,
    button3Text:String, button3Correct:Bool, Button3Position:Int,
    button4Text:String, button4Correct:Bool, Button4Position:Int,
    button5Text:String, button5Correct:Bool, Button5Position:Int,
    button6Text:String, button6Correct:Bool, Button6Position:Int,
    button7Text:String, button7Correct:Bool, Button7Position:Int,
    button8Text:String, button8Correct:Bool, Button8Position:Int)]
    
        // Level 1
    = [(/* Level */ 1, /* Word */ "MACACO", /* Image */ "MACACO",
        /* Image 1  */ "MARTELO", /* Delete */ "RTELO",
        /* Image 2  */ "CAVALO",  /* Delete */ "VALO",
        /* Image 3  */ "CORACAO", /* Delete */ "RAÇÃO",
        /* Button 1 */ "MA",      /* Delete */ true,  /* Position */ 1,
        /* Button 2 */ "CA",      /* Delete */ true,  /* Position */ 2,
        /* Button 3 */ "CO",      /* Delete */ true,  /* Position */ 3,
        /* Button 4 */ "LO",      /* Delete */ false, /* Position */ 0,
        /* Button 5 */ "VA",      /* Delete */ false, /* Position */ 0,
        /* Button 6 */ "BLA",      /* Delete */ false, /* Position */ 0,
        /* Button 7 */ "TE",      /* Delete */ false, /* Position */ 0,
        /* Button 8 */ "RA",      /* Delete */ false, /* Position */ 0),
        
        // Level 2
        (/* Level */ 2, /* Word */ "TIJOLO", /* Image */ "TIJOLO",
            /* Image 1  */ "TIGRE",   /* Delete */ "GRE",
            /* Image 2  */ "QUEIJO",  /* Delete */ "QUEI",
            /* Image 3  */ "ESQUILO", /* Delete */ "ESQUI",
            /* Button 1 */ "TI", /* Delete */ true,  /* Position */ 1,
            /* Button 2 */ "JU", /* Delete */ false, /* Position */ 0,
            /* Button 3 */ "LA", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "TE", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "JO", /* Delete */ true,  /* Position */ 2,
            /* Button 6 */ "LU", /* Delete */ false, /* Position */ 0,
            /* Button 7 */ "LO", /* Delete */ true,  /* Position */ 3,
            /* Button 8 */ "TO", /* Delete */ false, /* Position */ 0),
        
        // Level 3
        (/* Level */ 3, /* Word */ "CAMELO", /* Image */ "CAMELO",
            /* Image 1  */ "CACHORRO", /* Delete */ "CHORRO",
            /* Image 2  */ "MEIA",  /* Delete */ "IA",
            /* Image 3  */ "ESQUILO", /* Delete */ "ESQUI",
            /* Button 1 */ "LA", /* Delete */ false, /* Position */ 0,
            /* Button 2 */ "CA", /* Delete */ true,  /* Position */ 1,
            /* Button 3 */ "CE", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "KA", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "MI", /* Delete */ false, /* Position */ 0,
            /* Button 6 */ "ME", /* Delete */ true,  /* Position */ 2,
            /* Button 7 */ "LU", /* Delete */ false, /* Position */ 0,
            /* Button 8 */ "LO", /* Delete */ true,  /* Position */ 3),
        
        // Level 4
        (/* Level */ 4, /* Word */ "PANELA", /* Image */ "PANELA",
            /* Image 1  */ "PASSARO", /* Delete */ "SSARO",
            /* Image 2  */ "BONECONEVE",  /* Delete */ "VE",
            /* Image 3  */ "LAPIS", /* Delete */ "PIS",
            /* Button 1 */ "ME", /* Delete */ false, /* Position */ 0,
            /* Button 2 */ "PO", /* Delete */ false, /* Position */ 0,
            /* Button 3 */ "PA", /* Delete */ true,  /* Position */ 1,
            /* Button 4 */ "NI", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "NE", /* Delete */ true,  /* Position */ 2,
            /* Button 6 */ "LA", /* Delete */ true,  /* Position */ 3,
            /* Button 7 */ "PE", /* Delete */ false, /* Position */ 0,
            /* Button 8 */ "LO", /* Delete */ false, /* Position */ 0),
        
        // Level 5
        (/* Level */ 5, /* Word */ "BOLACHA", /* Image */ "BOLACHA",
            /* Image 1  */ "BOLA", /* Delete */ "LA",
            /* Image 2  */ "LAPIS",  /* Delete */ "PIS",
            /* Image 3  */ "CHAPEU", /* Delete */ "PÉU",
            /* Button 1 */ "BO", /* Delete */ true, /* Position */ 1,
            /* Button 2 */ "PO", /* Delete */ false, /* Position */ 0,
            /* Button 3 */ "BA", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "LA", /* Delete */ true, /* Position */ 2,
            /* Button 5 */ "MA", /* Delete */ false, /* Position */ 0,
            /* Button 6 */ "LE", /* Delete */ false, /* Position */ 0,
            /* Button 7 */ "CHA", /* Delete */ true, /* Position */ 3,
            /* Button 8 */ "XA", /* Delete */ false, /* Position */ 0),
        
        // Level 6
        (/* Level */ 6, /* Word */ "PEGADA", /* Image */ "PEGADA",
            /* Image 1  */ "PEIXE", /* Delete */ "IXE",
            /* Image 2  */ "GATO",  /* Delete */ "TO",
            /* Image 3  */ "LAMPADA", /* Delete */ "LAMPA",
            /* Button 1 */ "PI", /* Delete */ false, /* Position */ 0,
            /* Button 2 */ "PE", /* Delete */ true,  /* Position */ 1,
            /* Button 3 */ "BE", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "GA", /* Delete */ true,  /* Position */ 2,
            /* Button 5 */ "LA", /* Delete */ false, /* Position */ 0,
            /* Button 6 */ "DA", /* Delete */ true,  /* Position */ 3,
            /* Button 7 */ "BA", /* Delete */ false, /* Position */ 0,
            /* Button 8 */ "PA", /* Delete */ false, /* Position */ 0),
        
        // Level 7
        (/* Level */ 7, /* Word */ "PETECA", /* Image */ "PETECA",
            /* Image 1  */ "PEIXE", /* Delete */ "IXE",
            /* Image 2  */ "ELEFANTE",  /* Delete */ "ELEFAN",
            /* Image 3  */ "CACHORRO", /* Delete */ "CHORRO",
            /* Button 1 */ "PE", /* Delete */ true,  /* Position */ 1,
            /* Button 2 */ "PI", /* Delete */ false, /* Position */ 0,
            /* Button 3 */ "BE", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "TI", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "TE", /* Delete */ true,  /* Position */ 2,
            /* Button 6 */ "CA", /* Delete */ true,  /* Position */ 3,
            /* Button 7 */ "KA", /* Delete */ false, /* Position */ 0,
            /* Button 8 */ "TA", /* Delete */ false, /* Position */ 0),
        
        // Level 8
        (/* Level */ 8, /* Word */ "CANELA", /* Image */ "CANELA",
            /* Image 1  */ "CAMELO", /* Delete */ "MELO",
            /* Image 2  */ "BONECONEVE",  /* Delete */ "VE",
            /* Image 3  */ "LAPIS", /* Delete */ "PIS",
            /* Button 1 */ "TA", /* Delete */ false, /* Position */ 0,
            /* Button 2 */ "CA", /* Delete */ true,  /* Position */ 1,
            /* Button 3 */ "BA", /* Delete */ false, /* Position */ 0,
            /* Button 4 */ "ME", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "NE", /* Delete */ true,  /* Position */ 2,
            /* Button 6 */ "TE", /* Delete */ false, /* Position */ 0,
            /* Button 7 */ "LA", /* Delete */ true,  /* Position */ 3,
            /* Button 8 */ "NI", /* Delete */ false, /* Position */ 0),
        
        // Level 9
        (/* Level */ 9, /* Word */ "JANELA", /* Image */ "JANELA",
            /* Image 1  */ "JACARE", /* Delete */ "CARE",
            /* Image 2  */ "BONECONEVE",  /* Delete */ "VE",
            /* Image 3  */ "BOLA", /* Delete */ "BO",
            /* Button 1 */ "XA", /* Delete */ false, /* Position */ 0,
            /* Button 2 */ "PA", /* Delete */ false, /* Position */ 0,
            /* Button 3 */ "JA", /* Delete */ true,  /* Position */ 1,
            /* Button 4 */ "ME", /* Delete */ false, /* Position */ 0,
            /* Button 5 */ "NE", /* Delete */ true,  /* Position */ 2,
            /* Button 6 */ "NI", /* Delete */ false, /* Position */ 0,
            /* Button 7 */ "RA", /* Delete */ false, /* Position */ 0,
            /* Button 8 */ "LA", /* Delete */ true,  /* Position */ 3),]
    //================================================================================
    
    
    
    // MARK: - Tutorial
    //================================================================================
    func showTutorial(view:UIView, greenLabel:UILabel, hand:UIButton, handX:CGFloat, handY:CGFloat, destiny1:UILabel, d1x:CGFloat, d1y:CGFloat, destiny2:UIButton, d2x:CGFloat, d2y:CGFloat)
    {
        greenLabel.borderColor = UIColor.greenColor()
        hand.frame.origin.x = handX
        hand.frame.origin.y = handY
        UIView.showTutorial(view, hand: hand, destiny1: destiny1, x1: d1x, y1: d2y, destiny2: destiny2, x2: d2x, y2: d2y)
        enableButton(destiny2)
    }
    
    func enableButton(button:UIButton)
    { button.enabled = true }
    //================================================================================
    
    
    
    // MARK: - Displace Animation
    //================================================================================
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
    //================================================================================
    
}
