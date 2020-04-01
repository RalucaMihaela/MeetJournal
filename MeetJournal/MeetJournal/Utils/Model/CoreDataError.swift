//
//  Error.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 01/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation

enum CoreDataError: Error {
    case invalidName
    case invalidLocation
    case invalidItems
    case coreDataError
}

extension CoreDataError: CustomStringConvertible {
         var description: String {
         switch self {
             case .invalidName:
                 return "Please fill in the name"
             case .invalidLocation:
                return "The location was not mentioned"
             case .invalidItems:
                return "Please fill in the name and the location"
             case .coreDataError:
                return "Please try again"
      }
   }
}
