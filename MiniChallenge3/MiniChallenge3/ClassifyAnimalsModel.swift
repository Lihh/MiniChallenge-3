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
    = [(1, "CACHORRO",
        "CACHORRO", "________",
        "GATO", false, "CAVALO", false, "CACHORRO", true,
        "URSO", false, "RAPOSA", false, "BORBOLETA", false),
        //2
        (2, "GATO",
            "GATO", "____",
            "CACHORRO", false, "URSO", false, "LEAO", false,
            "COELHO", false, "GATO", true, "RATO", false),
        //3
        (3, "PASSARO",
            "CACHORRO", "_______",
            "BORBOLETA", false, "LOBO", false, "URUBU", false,
            "PASSARO", true, "FORMIGA", false, "MACACO", false),
        //4
        (4, "PEIXE",
            "CACHORRO", "_____",
            "TUBARAO", false, "GOLFINHO", false, "BALEIA", false,
            "TUCANO", false, "CAVALO", false, "PEIXE", true),
        //5
        (5, "CAVALO",
            "CACHORRO", "______",
            "CAVALO", true, "CACHORRO", false, "ELEFANTE", false,
            "ZEBRA", false, "CAMELO", false, "BOI", false),
        //6
        (6, "COELHO",
            "CACHORRO", "______",
            "GATO", false, "ABELHA", false, "LEAO", false,
            "RATO", false, "COELHO", true, "PASSARO", false),
        //7
        (7, "TIGRE",
            "CACHORRO", "_____",
            "LEAO", false, "TIGRE", true, "GATO", false,
            "CACHORRO", false, "CAVALO", false, "ONCA", false),
        //8
        (8, "HIPOPOTAMO",
            "CACHORRO", "__________",
            "CAVALO", false, "CACHORRO", false, "RINOCERONTE", false,
            "AGUIA", false, "ELEFANTE", false, "HIPOPOTAMO", true),
        //9
        (9, "CAMELO",
            "CACHORRO", "______",
            "COELHO", false, "CAVALO", false, "DROMEDARIO", false,
            "CAMELO", true, "MARIPOSA", false, "MACACO", false)]
   
    
    
}
