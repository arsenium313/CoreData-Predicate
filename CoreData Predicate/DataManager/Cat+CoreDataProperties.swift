//
//  Cat+CoreDataProperties.swift
//  CoreData Predicate
//
//  Created by Арсений Кухарев on 14.01.2023.
//
//

import Foundation
import CoreData


extension Cat {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cat> {
        return NSFetchRequest<Cat>(entityName: "Cat")
    }

    @NSManaged public var age: Int16
    @NSManaged public var color: String
    @NSManaged public var name: String
    @NSManaged public var picture: String
    @NSManaged public var heartRate: Int16
    @NSManaged public var funRate: Int16
    @NSManaged public var lovelinessRate: Int16

}

extension Cat : Identifiable {

}
