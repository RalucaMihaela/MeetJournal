//
//  PersonView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 25/03/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct PersonView: View {
    @ObservedObject var viewModel: PersonViewModel = PersonViewModel()
    
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var comment: String = ""
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image("friends")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding(.bottom, 100)
            
            TextField("Name", text: $name)
                .padding()
                .background(Color(UIColor.accent2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)

            TextField("Location", text: $location)
                .padding()
                .background(Color(UIColor.accent2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            TextField("Comments", text: $comment)
                .padding()
                .background(Color(UIColor.accent2))
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            
            Button(action: {
                self.viewModel.addNewPerson(name: self.name, location: self.location, comment: self.comment)
                self.isPresented = false
            }) {
                Text("ADD")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(
                        Color(UIColor.accent1)
                )
                    .cornerRadius(15.0)
            }
            
        }.padding(40)
    }
}
