//
//  HistoryViewModel.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import Combine

final class HistoryViewModel: ObservableObject {
    @Published private(set) var persons: [Person] = []
    
    func loadData() {
        guard persons.isEmpty else { return }
        
        let dummyPerson1 = Person(name: "Raluca", location: "Birou",date: "25.05.2020")
        let dummyPerson2 = Person(name: "Vanzatoare", location: "Carrefour",date: "25.05.2020")
        let dummyPerson3 = Person(name: "Raluca", location: "Birou",date: "25.05.2020")
        let dummyPerson4 = Person(name: "Raluca", location: "Birou",date: "25.05.2020")
        
        self.persons.append(dummyPerson1)
        self.persons.append(dummyPerson2)
        self.persons.append(dummyPerson3)
        self.persons.append(dummyPerson4)
    }
}
