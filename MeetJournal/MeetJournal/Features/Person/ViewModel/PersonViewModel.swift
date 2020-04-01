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
    private var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    func addNewPerson(name: String, location: String, comment: String)  {
        let newPerson = History(context: self.managedObjectContext)
        newPerson.name = name
        newPerson.location = location
        newPerson.comment = comment
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
