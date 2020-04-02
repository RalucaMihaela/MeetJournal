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
    @State var focused: [Bool] = [true, false, false]
    
    @Binding var isPresented: Bool
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    
                    Image("friends")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 200)
                        .padding(.bottom, 20)
                    
                    Spacer()
                }
            }
            
            Section {
                TextFieldTyped(keyboardType: .default,
                               returnVal: .next,
                               placeholder: "Name",
                               tag: 0,
                               text: $name,
                               isfocusAble: $focused)
                    .modifier(PrimaryTextField())
                
                TextFieldTyped(keyboardType: .default,
                               returnVal: .next,
                               placeholder: "Location",
                               tag: 1,
                               text: $location,
                               isfocusAble: $focused)
                    .modifier(PrimaryTextField())
                
                TextFieldTyped(keyboardType: .default,
                               returnVal: .done,
                               placeholder: "Comments (optional)",
                               tag: 2,
                               text: $comment,
                               isfocusAble: $focused)
                    .modifier(PrimaryTextField())
            }.padding([.leading, .trailing], 40)
            
            Section {
                HStack {
                    Spacer()
                    
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
                    
                    Spacer()
                }
            }
        }.modifier(AdaptsToSoftwareKeyboard())
    }
}
