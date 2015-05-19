//
//  Score.swift
//  
//
//  Created by Kaique Damato on 5/18/15.
//
//

import Foundation
import CoreData

@objc(Score)
class Score: NSManagedObject {

    @NSManaged var exercise: String
    @NSManaged var level: NSNumber
    @NSManaged var quantityOfStars: NSNumber

}
