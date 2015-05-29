//
//  CompleteTheWordModel.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 29/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CompleteTheWordModel: NSObject
{
    
    // Singleton
    static let sharedInstance = CompleteTheWordModel()
    
    // Array Levels
    var levels: [(level:Int, wordImage:String, incompleteWord:String, finish:Int,
    button1Text: String, button1Correct:Bool, button1Displacement: CGFloat,
    button2Text: String, button2Correct:Bool, button2Displacement: CGFloat,
    button3Text: String, button3Correct:Bool, button3Displacement: CGFloat,
    button4Text: String, button4Correct:Bool, button4Displacement: CGFloat,
    button5Text: String, button5Correct:Bool, button5Displacement: CGFloat)]
    // Level 1
    = [ (1, "GATO", "G _ T O", 1,
        "A", true, 1.1, "E", false, 0, "I", false, 0, "O", false, 0, "U", false, 0),
        
        // Level 2
        (2, "PEIXE", "P _ _ X E", 2,
            "A", false, 0, "E", true, 1.15, "I", true, 2.44, "O", false, 0, "U", false, 0),
        
        // Level 3
        (3, "COELHO", "C _ _ L H O", 2,
            "A", false, 0, "E", true, 2.35, "I", false, 0, "O", true, 1.05, "U", false, 0),
        
        // Level 4
        (4, "CACHORRO", "C _ C H _ R R O", 2,
            "A", true, 1.05, "E", false, 0,  "I", false, 0, "O", true, 4.77, "U", false, 0),
        
        // Level 5
        (5, "TIGRE", "T _ G R _ ", 2,
            "A", false, 0, "E", true, 5, "I", true, 1.25, "O", false, 0, "U", false, 0),
        
        // Level 6
        (6, "LEAO", "L _ _ O ", 2,
            "A", true, 2.55, "E", true, 1.2, "I", false, 0, "O", false, 0, "U", false, 0),
        
        // Level 7
        (7, "ESQUILO", " _ S Q _ _ L O", 3,
            "A", false, -0.3, "E", true, 0.35, "I", true, 5.34, "O", false, 0, "U", true, 4),
        
        // Level 8
        (8, "CAMELO", "C _ M _ L _ ", 3,
            "A", true, 1.25, "E", true, 4, "I", false, 0, "O", true, 6.43, "U", false, 0),
        
        // Level 9
        (9, "HIPOPOTAMO", "H _ P _ P O T _ M O", 3,
            "A", true, 8.6, "E", false, 0, "I", true, 1.2, "O", true, 3.7, "U", false, 0)]
    //============================================================
   
}
