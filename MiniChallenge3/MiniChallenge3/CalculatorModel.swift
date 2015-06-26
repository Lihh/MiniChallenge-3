//
//  CalculatorModel.swift
//  MiniChallenge3
//
//  Created by Lidia Chou on 5/29/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CalculatorModel: NSObject {
    
    static let sharedInstance = CalculatorModel()
    
    var levels: [(lvl:Int,
    firstOp:String,
    correctAnswer1:String,
    secondOp:String,
    correctAnswer2:String,
    button1Text: String, button1Correct:Bool,
    button2Text: String, button2Correct:Bool,
    button3Text: String, button3Correct:Bool,
    button4Text: String, button4Correct:Bool,
    button5Text: String, button5Correct:Bool,
    button6Text: String, button6Correct:Bool)]
    //1
    = [(1, "1  +  2", "3",    "3  +  4", "7",
            "2", false, "4", false, "3", true,
            "7", true, "5", false, "6", false),
        //2
        (2, "2  +  2", "4",    "5  +  4", "9",
            "7", false, "4", true, "8", false,
            "0", false, "9", true, "2", false),
        //3
        (3, "4  +  2", "6",    "5  -  4", "1",
            "5", false, "2", false, "6", true,
            "1", true, "0", false, "9", false),
        //4
        (4, "5  -  2", "3",    "9  -  3", "6",
            "0", false, "3", true, "7", false,
            "3", false, "6", true, "9", false),
        //5
        (5, "9  -  5", "4",   "2  -  2", "0",
            "4", true, "9", false, "6", false,
            "0", true, "8", false, "1", false),
        //6
        (6, "6  -  4", "2",    "1  x  5", "5",
            "4", false, "3", false, "2", true,
            "1", false, "5", true, "0", false),
        //7
        (7, "3  x  3", "9",    "2  x  3", "6",
            "7", false, "9", true, "3", false,
            "8", false, "0", false, "6", true),
        //8
        (8, "4  x  2", "8",   "2  ÷  1", "2",
            "8", true, "7", false, "0", false,
            "2", true, "4", false, "1", false),
        //9
        (9, "8  ÷  2", "4",   "8  ÷  4", "2",
            "0", false, "9", false, "4", true,
            "7", false, "2", true, "6", false)]
    
    
   
}
