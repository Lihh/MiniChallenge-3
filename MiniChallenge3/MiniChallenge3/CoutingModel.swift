//
//  CoutingModel.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 29/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class CoutingModel: NSObject {
    
    // Singleton
    static let sharedInstance = CoutingModel()
    
    // Levels Array
    var levels:[(level:Int, gameTitle:String, finish:Int, question:String, correctImage:String, wrongImage:String,
    button1Correct: Bool, button2Correct: Bool, button3Correct: Bool, button4Correct: Bool,
    button5Correct: Bool, button6Correct: Bool, button7Correct: Bool, button8Correct: Bool,
    button9Correct: Bool, button10Correct:Bool, button11Correct:Bool, button12Correct:Bool,
    button13Correct:Bool, button14Correct:Bool, button15Correct:Bool, button16Correct:Bool,
    button17Correct:Bool, button18Correct:Bool, button19Correct:Bool, button20Correct:Bool,
    option1Correct: Bool, option1Text:  String, option2Correct: Bool, option2Text:  String,
    option3Correct: Bool, option3Text:  String, option4Correct: Bool, option4Text:  String)]
    
    // Level 1
    = [ (1, "CLIQUE NOS PASSAROS", 5, "QUANTOS PASSAROS ?", "PASSARO", "CACHORRO",
        /*button  1*/  true, /*button  2*/ false, /*button  3*/ false, /*button  4*/ false,
        /*button  5*/ false, /*button  6*/  true, /*button  7*/ false, /*button  8*/ false,
        /*button  9*/ false, /*button 10*/ false, /*button 11*/  true, /*button 12*/ false,
        /*button 13*/ false, /*button 14*/ false, /*button 15*/ false, /*button 16*/  true,
        /*button 17*/ false, /*button 18*/ false, /*button 19*/ false, /*button 20*/  true,
        /*option  1*/ false, /*  text   */   "2", /*option  2*/ false, /*  text   */   "3",
        /*option  3*/ false, /*  text   */   "4", /*option  4*/  true, /*text     */   "5"),
        
        // Level 2
        (2, "CLIQUE NOS CACHORROS", 4, "QUANTOS CACHORROS ?", "CACHORRO", "PASSARO",
            /*button  1*/ false, /*button  2*/ false, /*button  3*/  true, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/ false, /*button  7*/ false, /*button  8*/  true,
            /*button  9*/  true, /*button 10*/ false, /*button 11*/ false, /*button 12*/ false,
            /*button 13*/ false, /*button 14*/ false, /*button 15*/ false, /*button 16*/ false,
            /*button 17*/ false, /*button 18*/ false, /*button 19*/  true, /*button 20*/ false,
            /*option  1*/ false, /*  text   */   "2", /*option  2*/ false, /*  text   */   "3",
            /*option  3*/  true, /*  text   */   "4", /*option  4*/ false, /*text     */   "5"),
        
        // Level 3
        (3, "CLIQUE NOS TIGRES", 5, "QUANTOS TIGRES ?", "TIGRE", "PEIXE",
            /*button  1*/ false, /*button  2*/  true, /*button  3*/ false, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/ false, /*button  7*/  true, /*button  8*/ false,
            /*button  9*/ false, /*button 10*/ false, /*button 11*/ false, /*button 12*/  true,
            /*button 13*/  true, /*button 14*/ false, /*button 15*/ false, /*button 16*/ false,
            /*button 17*/ false, /*button 18*/ false, /*button 19*/ false, /*button 20*/  true,
            /*option  1*/ false, /*  text   */   "3", /*option  2*/ false, /*  text   */   "4",
            /*option  3*/  true, /*  text   */   "5", /*option  4*/ false, /*text     */   "6"),
        
        // Level 4
        (4, "CLIQUE NOS URSOS", 7, "QUANTOS URSOS ?", "URSO", "COELHO",
            /*button  1*/  true, /*button  2*/ false, /*button  3*/  true, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/ false, /*button  7*/ false, /*button  8*/  true,
            /*button  9*/ false, /*button 10*/  true, /*button 11*/ false, /*button 12*/  true,
            /*button 13*/ false, /*button 14*/ false, /*button 15*/ false, /*button 16*/ false,
            /*button 17*/  true, /*button 18*/ false, /*button 19*/ false, /*button 20*/  true,
            /*option  1*/ false, /*  text   */   "6", /*option  2*/  true, /*  text   */   "7",
            /*option  3*/ false, /*  text   */   "8", /*option  4*/ false, /*text     */   "9"),
        
        // Level 5
        (5, "CLIQUE NOS PEIXES", 8, "QUANTOS PEIXES ?", "PEIXE", "RATO",
            /*button  1*/ false, /*button  2*/  true, /*button  3*/ false, /*button  4*/  true,
            /*button  5*/  true, /*button  6*/ false, /*button  7*/  true, /*button  8*/ false,
            /*button  9*/ false, /*button 10*/  true, /*button 11*/ false, /*button 12*/ false,
            /*button 13*/ false, /*button 14*/ false, /*button 15*/ false, /*button 16*/ false,
            /*button 17*/  true, /*button 18*/ false, /*button 19*/  true, /*button 20*/  true,
            /*option  1*/ false, /*  text   */   "5", /*option  2*/ false, /*  text   */   "6",
            /*option  3*/ false, /*  text   */   "7", /*option  4*/  true, /*text     */   "8"),
        
        // Level 6
        (6, "CLIQUE NOS MACACOS", 6, "QUANTOS MACACOS ?", "MACACO", "LEAO",
            /*button  1*/ false, /*button  2*/  true, /*button  3*/  true, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/ false, /*button  7*/ false, /*button  8*/ false,
            /*button  9*/ false, /*button 10*/ false, /*button 11*/ false, /*button 12*/ false,
            /*button 13*/ false, /*button 14*/  true, /*button 15*/  true, /*button 16*/ false,
            /*button 17*/  true, /*button 18*/ false, /*button 19*/ false, /*button 20*/  true,
            /*option  1*/ false, /*  text   */   "5", /*option  2*/  true, /*  text   */   "6",
            /*option  3*/ false, /*  text   */   "7", /*option  4*/ false, /*text     */   "8"),
        
        // Level 7
        (7, "CLIQUE NOS GATOS", 9, "QUANTOS GATOS ?", "GATO", "TIGRE",
            /*button  1*/ false, /*button  2*/ false, /*button  3*/  true, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/  true, /*button  7*/ false, /*button  8*/  true,
            /*button  9*/  true, /*button 10*/ false, /*button 11*/  true, /*button 12*/ false,
            /*button 13*/ false, /*button 14*/  true, /*button 15*/ false, /*button 16*/  true,
            /*button 17*/  true, /*button 18*/ false, /*button 19*/  true, /*button 20*/ false,
            /*option  1*/ false, /*  text   */   "6", /*option  2*/ false, /*  text   */   "7",
            /*option  3*/ false, /*  text   */   "8", /*option  4*/  true, /*text     */   "9"),
        
        // Level 8
        (8, "CLIQUE NOS CAVALOS", 4, "QUANTOS CAVALOS ?", "CAVALO", "CAMELO",
            /*button  1*/ false, /*button  2*/  true, /*button  3*/ false, /*button  4*/ false,
            /*button  5*/ false, /*button  6*/ false, /*button  7*/ false, /*button  8*/ false,
            /*button  9*/ false, /*button 10*/ false, /*button 11*/  true, /*button 12*/ false,
            /*button 13*/  true, /*button 14*/ false, /*button 15*/ false, /*button 16*/ false,
            /*button 17*/ false, /*button 18*/ false, /*button 19*/ false, /*button 20*/  true,
            /*option  1*/  true, /*  text   */   "4", /*option  2*/ false, /*  text   */   "5",
            /*option  3*/ false, /*  text   */   "6", /*option  4*/ false, /*text     */   "7"),
        
        // Level 9
        (9, "CLIQUE NOS ELEFANTES", 6, "QUANTOS ELEFANTES ?", "ELEFANTE", "HIPOPOTAMO",
            /*button  1*/ false, /*button  2*/ false, /*button  3*/ false, /*button  4*/ false,
            /*button  5*/  true, /*button  6*/  true, /*button  7*/ false, /*button  8*/ false,
            /*button  9*/ false, /*button 10*/ false, /*button 11*/  true, /*button 12*/ false,
            /*button 13*/ false, /*button 14*/  true, /*button 15*/ false, /*button 16*/  true,
            /*button 17*/ false, /*button 18*/ false, /*button 19*/  true, /*button 20*/ false,
            /*option  1*/ false, /*  text   */   "5", /*option  2*/  true, /*  text   */   "6",
            /*option  3*/ false, /*  text   */   "7", /*option  4*/ false, /*text     */   "8")]
    //================================================================================
   
}
