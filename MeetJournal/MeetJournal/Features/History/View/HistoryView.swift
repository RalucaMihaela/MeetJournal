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
    @State var shouldShowList = false
    
    var body: some View {
        VStack {
            Form {
                DatePicker(selection: $currentDate,
                           in: ...Date(),
                           displayedComponents: .date) {
                            Text("Select a date")
                }
                
                if !self.viewModel.fetchResults(date: $currentDate.wrappedValue).isEmpty {
                    List {
                        ForEach(self.viewModel.fetchResults(date: $currentDate.wrappedValue)) { person in
                            HistoryListRow(personName: person.name,
                                           personLocation: person.location,
                                           personComment: person.comment ?? "",
                                           personDate: person.date)
                        }
                    }
                } else {
                    VStack {
                        Image("today")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .padding([.top, .leading, .bottom, .trailing])
                        
                        Image("face")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                    }.padding(.top, 50)
                }
            }
        }
    }
}
