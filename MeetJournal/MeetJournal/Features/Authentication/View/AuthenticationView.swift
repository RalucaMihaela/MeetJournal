//
//  AuthenticationView.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 03/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import SwiftUI

struct AuthenticationView: View {
    @ObservedObject var viewModel: AuthenticationViewModel = AuthenticationViewModel()
    
    @State var shouldShowMenu = false
    
    var body: some View {
            ZStack {
                Color.red
                
                if self.shouldShowMenu {
                    MenuTabView()
                   
                }
            }
        .onAppear{
            self.viewModel.detectFaceID()
        }
        .onReceive(self.viewModel.$state) { value in
            if value == .loggedin {
                self.shouldShowMenu = true
            }
        }
        
    }
}
