//
//  HistoryViewModel.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 31/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import CoreData
import UIKit

final class HistoryViewModel: ObservableObject {
    private var managedObjectContext: NSManagedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @Published private(set) var historyItems: [History] = []
    
    func fetchResults(date: Date) -> [History] {
        let historyFetch : NSFetchRequest<History> = History.fetchRequest()
        historyFetch.predicate = NSPredicate.filter(key: "date", onDayRangeForDate: date)
        
        do {
            return try managedObjectContext.fetch(historyFetch)
        } catch {
            return []
        }
    }
}
