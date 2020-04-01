//
//  HistoryListRowRightView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 02/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct HistoryListRowRightView: View {
    var personName: String
    var personLocation:String
    var personComment: String
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 10) {
                VStack() {
                    Text("WHO")
                        .font(.system(size: 10))
                        .foregroundColor(Color.gray)
                    Text(self.personName)
                        .font(.custom("ClanOT-News", size: 15))
                        .padding(.top, 5)
                        .lineLimit(nil)
                }.frame(minWidth: 0, maxWidth: .infinity)
                
                VStack() {
                    Text("WHERE")
                        .font(.system(size: 10))
                        .foregroundColor(Color.gray)
                    Text(self.personLocation)
                        .font(.custom("ClanOT-News", size: 15))
                        .padding(.top, 5)
                        .lineLimit(nil)
                }.frame(minWidth: 0, maxWidth: .infinity)
            }.frame(minWidth: 0, maxWidth: .infinity)
            
            Text(self.personComment)
                .font(.custom("ClanOT-News", size: 12))
                .foregroundColor(Color.gray)
                .padding([.leading, .trailing],5)
                .padding(.top,20)
                .lineLimit(nil)
            
        }
        
    }
}
