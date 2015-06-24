//
//  ClassifyAnimalsModel.swift
//  MiniChallenge3
//
//  Created by Cauê Silva on 29/05/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit

class ClassifyAnimalsModel: NSObject {
    
    // Singleton
    static let sharedInstance = ClassifyAnimalsModel()
    
    var levels: [(lvl:Int, titleText: String,
    animalImage: String, labelText: String,
    button1Text: String, button1Correct:Bool,
    button2Text: String, button2Correct:Bool,
    button3Text: String, button3Correct:Bool,
    button4Text: String, button4Correct:Bool,
    button5Text: String, button5Correct:Bool,
    button6Text: String, button6Correct:Bool)]
    
        //1
    = [ (1, "Classifique: Classe",
            "CACHORRO", "________",
            "AVE", false, "INSETO", false, "MAMÍFERO", true,
            "REPTIL", false, "ANFÍBIO", false, "PEIXE", false),
        //2
        (2, "Classifique: Classe",
            "PEIXE", "____",
            "AVE", false, "INSETO", false, "MAMÍFERO", false,
            "REPTIL", false, "ANFÍBIO", false, "PEIXE", true),
        //3
        (3, "Classifique: Classe",
            "PASSARO", "____",
            "AVE", true, "INSETO", false, "MAMÍFERO", false,
            "REPTIL", false, "ANFÍBIO", false, "PEIXE", true),
        //4
        (4, "Classifique: Casa",
            "CAMELO", "_______",
            "DESERTO", true, "FLORESTA", false, "CIDADE", false,
            "PÂNTANO", false, "SELVA", false, "PRAIA", false),
        //5
        (5, "Classifique: Casa",
            "LEAO", "_____",
            "DESERTO", false, "FLORESTA", false, "CIDADE", false,
            "PÂNTANO", false, "SELVA", true, "PRAIA", false),
        //6
        (6, "Classifique: Alimentação",
            "URSO", "______",
            "OVÍPARO", false, "CARNÍVORO", true, "HERBÍVORO", false,
            "INSECTÍVORO", false, "ONÍVORO", false, "FRUTÍCORO", false),
        //7
        (7, "Classifique: Alimentação",
            "COELHO", "______",
            "OVÍPARO", false, "CARNÍVORO", false, "HERBÍVORO", true,
            "INSECTÍVORO", false, "ONÍVORO", false, "FRUTÍCORO", false),
        //8
        (8, "Classifique: Ordem",
            "ESQUILO", "_____",
            "CETÁCEA", false, "MARSUPIAL", false, "VOADOR", false,
            "ROEDOR", true, "INSETO", false, "PRIMATA", false),
        //9
        (9, "Classifique: Ordem",
            "MACACO", "__________",
            "CETÁCEA", false, "MARSUPIAL", false, "VOADOR", false,
            "ROEDOR", false, "INSETO", false, "PRIMATA", true)]
   
    
    
}
