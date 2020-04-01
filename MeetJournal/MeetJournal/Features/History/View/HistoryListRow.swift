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
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.accent1.withAlphaComponent(0.6)))
                .cornerRadius(20)
                .frame(height: 100)
            
            VStack(alignment: .leading) {
                Text(person.name)
                    .font(.title)
                    .padding(.leading)
                
//                HStack {
//                    Text("Street")
//                        .fontWeight(.bold)
                    Text(person.location)
//                        .padding(.leading)
//                        .padding(.top, 5)
//                        .padding(.bottom, 5)
                        .padding([.top, .bottom, .leading])
                        .font(.subheadline)
                
                Text(person.comment)
                    .padding(.leading)
                    .font(.caption)
                
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
        }
    }
}
