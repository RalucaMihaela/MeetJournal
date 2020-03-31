//
//  MenuTabView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct MenuTabView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    
    @State private var tabSelection: Int = 0
    @State var showNewItem: Bool = false
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                TabView(selection: self.$tabSelection) {
                    HistoryView().tabItem {
                               Text("")
                     }.tag(0)
                }
                
                Image("circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .shadow(color: .gray, radius: 2, x: 0, y: 5)
                        .offset(x: geometry.size.width / 2 - 30, y: geometry.size.height - 80)
                        .onTapGesture {
                            self.showNewItem.toggle()
                }
            }
        }.sheet(isPresented: $showNewItem, content: {
            PersonView()
        })
    }
}
