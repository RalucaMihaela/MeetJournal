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
    @State var shouldShowAlert: Bool = false
    @State var errorMessage: CoreDataError = .coreDataError
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack {
            Image("friends")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .padding(.bottom, 100)
            
            TextField("Name", text: $name)
                .modifier(PrimaryTextField())

            TextField("Location", text: $location)
                .modifier(PrimaryTextField())
            
            TextField("Comments", text: $comment)
                .modifier(PrimaryTextField())
            
            Button(action: {
                do {
                    try self.viewModel.addNewPerson(name: self.name, location: self.location, comment: self.comment)
                    self.isPresented = false
                } catch {
                    self.errorMessage = error as! CoreDataError
                    self.shouldShowAlert.toggle()
                }
            }, label: {
                Text("ADD")
            }).modifier(PrimaryButton())
            .alert(isPresented: $shouldShowAlert) {
                Alert(title: Text("Error"),
                      message: Text("\(errorMessage.description)"),
                      dismissButton: .default(Text("OK")))
             }
            
        }.padding(40)
    }
}
