//
//  HistoryView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct HistoryView: View {
    @ObservedObject var viewModel: HistoryViewModel = HistoryViewModel()
    
    @State private var currentDate = Date()
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    var body: some View {
        VStack {
            Form {
                DatePicker(selection: $currentDate,
                           in: ...Date(),
                           displayedComponents: .date) {
                            Text("Select a date")
                }
                
                List {
                    ForEach(self.viewModel.fetchResults(date: $currentDate.wrappedValue)) { person in
                        HistoryListRow(person: Person(name: person.name,
                                                      location: person.location,
                                                      comment: person.comment ?? ""))
                    }
                }
            }
        }
    }
}
