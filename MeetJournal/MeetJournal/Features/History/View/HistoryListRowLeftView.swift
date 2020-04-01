//
//  HistoryListRowLeftView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 02/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct HistoryListRowLeftView: View {
    var personDate: Date
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(.accent1))
                .frame(width: 100)
            
            VStack {
                Text(self.personDate.getDay())
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(self.personDate.getMonth())
                    .font(.title)
                    .foregroundColor(.white)
                
                Text(self.personDate.getHour())
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(.top, 10)
            }
        }
    }
}
