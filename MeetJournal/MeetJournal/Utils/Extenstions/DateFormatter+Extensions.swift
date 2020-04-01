//
//  DateFormatter+Extensions.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 02/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation

//extension DateFormatter {
//
//    var dayFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd"
//        return formatter
//    }
//
//    var monthFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MMMM"
//        return formatter
//    }
//
//    var hourFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "hh:mm a"
//        return formatter
//    }
//
//    func getDay(date: Date) -> String {
//        return self.dayFormatter.string(from: date)
//    }
//
//    func getMonth(date: Date) -> String {
//        return self.monthFormatter.string(from: date)
//    }
//
//    func getHour(date: Date) -> String {
//        return self.hourFormatter.string(from: date)
//    }
//
//}

protocol Dateable {
    func getDay() -> String
    func getMonth() -> String
    func getHour() -> String
}

extension Date: Dateable {
    var  formatter: DateFormatter { return DateFormatter() }

    func getDay() -> String {
        return self.convertToLocaleDate(template: "dd")
    }
    
    func getMonth() -> String {
        return self.convertToLocaleDate(template: "MMMM")
    }
    
    func getHour() -> String {
        return self.convertToLocaleDate(template: "hh:mm a")
    }
    
    private func convertToLocaleDate(template: String) -> String {
        let dateFormatter = DateFormatter()

        let calender = Calendar.current

        dateFormatter.timeZone = calender.timeZone
        dateFormatter.locale = calender.locale
        dateFormatter.setLocalizedDateFormatFromTemplate(template)

        return dateFormatter.string(from: self)
    }
}
