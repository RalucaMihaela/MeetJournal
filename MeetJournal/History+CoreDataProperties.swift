//
//  History+CoreDataProperties.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 27/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//
//

import Foundation
import CoreData


extension History : Identifiable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<History> {
        return NSFetchRequest<History>(entityName: "History")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String
    @NSManaged public var location: String
    @NSManaged public var date: Date
    @NSManaged public var comment: String?

}
