//
//  NSPredicate+Extensions.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 01/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation

extension NSPredicate {

    static func filter(key: String, onDayRangeForDate date: Date, calendar: Calendar = Calendar(identifier: .gregorian)) -> NSPredicate {

        let dateComponents = calendar.dateComponents([.day, .month, .year], from: date)

        let startOfDay = calendar.date(from: dateComponents)!

        let offsetComponents = NSDateComponents()
        offsetComponents.day = 1
        let endOfDay = calendar.date(byAdding: offsetComponents as DateComponents, to: startOfDay)!

        return NSPredicate(format: "\(key) >= %@ && \(key) < %@",
            startOfDay as NSDate, endOfDay as NSDate)
    }
}
