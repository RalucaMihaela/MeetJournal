//
//  Person.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation

struct Person {
    let id: UUID = UUID()
    let name: String
    let location: String
    let date: String
}

extension Person: Identifiable {}
