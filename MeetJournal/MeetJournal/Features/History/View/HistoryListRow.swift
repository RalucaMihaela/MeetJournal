//
//  HistoryListRow.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct HistoryListRow: View {
    
    var personName: String
    var personLocation: String
    var personComment: String
    var personDate: Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.accent3))
                .frame(height: 130)
            
            HStack {
                
                HistoryListRowLeftView(personDate: self.personDate)
                
                HistoryListRowRightView(personName: self.personName,
                                        personLocation: self.personLocation,
                                        personComment: self.personComment)
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .cornerRadius(10)
    }
}
