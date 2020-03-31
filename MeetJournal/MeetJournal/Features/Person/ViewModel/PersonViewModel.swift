//
//  PersonViewModel.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 30/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import Combine
import CoreData
import UIKit

final class PersonViewModel: ObservableObject {
    var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func addNewPerson(item: Person, completionBlock: ((Error?) -> Void)) {
        let newPerson = History(context: self.managedObjectContext)
        newPerson.name = item.name
        newPerson.location = item.location
        newPerson.comment = item.comment
        newPerson.date = Date()
        newPerson.id = UUID()
        
        do {
            try self.managedObjectContext.save()
            print("Order saved.")
        } catch {
            print(error.localizedDescription)
        }
    }
}
