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
    
    @State private var activeFieldTag : [Int?] = [0,1,2]
    
    @State private var isSecureField : Bool = false
    
    var body: some View {
        return Form {
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

                CustomTextField(tag: 0,
                                placeholder: "Name",
                                keyboardType: .default,
                                returnVal: .next,
                                text: $name,
                                activeFieldTag: $activeFieldTag[0],
                                isSecureTextEntry: $isSecureField)
                    .modifier(PrimaryTextField())

                CustomTextField(tag: 1,
                            placeholder: "Location",
                            keyboardType: .default,
                            returnVal: .next,
                            text: $location,
                            activeFieldTag: $activeFieldTag[1],
                            isSecureTextEntry: $isSecureField)
                .modifier(PrimaryTextField())

                CustomTextField(tag: 2,
                            placeholder: "Comment (optional)",
                            keyboardType: .default,
                            returnVal: .done,
                            text: $comment,
                            activeFieldTag: $activeFieldTag[2],
                            isSecureTextEntry: $isSecureField)
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
        .onReceive(self.viewModel.$latestLocation) { value in
            self.location = value
        }
    }
}
