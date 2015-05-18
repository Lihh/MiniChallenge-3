//
//  Persistence.swift
//  MiniChallenge3
//
//  Created by Kaique Damato on 5/18/15.
//  Copyright (c) 2015 Lidia Chou. All rights reserved.
//

import UIKit
import CoreData

public class Persistence {
    static let sharedInstance = Persistence()
    static let entityName = "Score"
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
    }()
    
    private init(){}
    
    func saveContext() {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println("Could not save. Error: \(error), \(error!.userInfo)")
        }
    }
    
    func newScore(exercise: String, level: Int, quantityOfStars: NSData) {
        let entity = NSEntityDescription.entityForName(Persistence.entityName, inManagedObjectContext: managedContext)
        let score = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext) as! Score
        
        score.exercise = exercise
        score.level = level
        score.quantityOfStars = quantityOfStars
        
        self.saveContext()
    }
}