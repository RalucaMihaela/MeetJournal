//
//  HistoryListRow.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct HistoryListRow: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color(UIColor.accent1.withAlphaComponent(0.6)))
                .cornerRadius(20)
                .frame(height: 50)
        }
    }
}
