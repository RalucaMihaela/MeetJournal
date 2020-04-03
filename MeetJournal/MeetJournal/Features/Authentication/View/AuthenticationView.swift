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
            Color.init(UIColor.accent1)
                .edgesIgnoringSafeArea(.vertical)
            
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 350)
                    .padding(.top, 10)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(width:200, height:200)
                        .cornerRadius(20)
                        .onTapGesture {
                            self.viewModel.detectFaceID()
                    }
                    
                    VStack {
                        Image(systemName: "faceid")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width:50, height:50)
                            .foregroundColor(Color(UIColor.accent1))
                        
                        Spacer()
                            .frame(height: 30)
                        
                        Text("Tap to Login with")
                        
                        Text("Face ID")
                            .font(.custom("ClanOT-Medium", size: 17))
                            .foregroundColor(Color(UIColor.accent1))
                    }
                }.padding(.bottom, 200)
            }
            
            if self.shouldShowMenu {
                MenuTabView()
            }
        }.onAppear{
            self.viewModel.detectFaceID()
        }
        .onReceive(self.viewModel.$state) { value in
            if value == .loggedin {
                self.shouldShowMenu = true
            }
        }
        
    }
}
