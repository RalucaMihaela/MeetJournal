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
                
                VStack {
                    HStack(alignment: .top) {
                        VStack() {
                            Text("WHO")
                                .font(.system(size: 10))
                                .foregroundColor(Color.gray)
                            Text("Raluca Ionescu")
                                .font(.custom("ClanOT-News", size: 15))
                                .padding(.top, 5)
                                .lineLimit(nil)
                        }
                        
                        Spacer()
                            .frame(width: 10)
                        
                        VStack() {
                            Text("WHERE")
                                .font(.system(size: 10))
                                .foregroundColor(Color.gray)
                            Text("Strada Irina Rosetti nr.18 ")
                                .font(.custom("ClanOT-News", size: 15))
                                .padding(.top, 5)
                                .lineLimit(nil)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity)
                    }
                    
                    Text("In capatul strazii")
                        .font(.custom("ClanOT-News", size: 12))
                        .foregroundColor(Color.gray)
                        .padding([.leading, .trailing],5)
                        .padding(.top,20)
                        .lineLimit(nil)
                    
                }
                
            }.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
        }
        .cornerRadius(10)
    }
}
