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
    
    var body: some View {
        List {
            Section(header: HistoryListHeader(), content: {
                ForEach(self.viewModel.persons) { person in
                                       HistoryListRow()
                }
            })
        }.onAppear {
            self.viewModel.loadData()
        }
    }
}
