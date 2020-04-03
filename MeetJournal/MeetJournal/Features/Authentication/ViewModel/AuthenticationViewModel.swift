//
//  FaceIDAuthentication.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 03/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import Combine
import LocalAuthentication

final class AuthenticationViewModel: ObservableObject {
    
    /// An authentication context stored at class scope so it's available for use during UI updates.
    private var context = LAContext()
    
    /// The available states of being logged in or not.
    enum AuthenticationState {
        case loggedin, loggedout
    }
    
    /// The current authentication state.
    @Published private(set) var state = AuthenticationState.loggedout
    
    init(){
        context.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil)
        state = .loggedout
    }
    
    func detectFaceID(){
        /// Logs out or attempts to log in when the user taps the button.
            
            if state == .loggedin {
                
                // Log out immediately.
                state = .loggedout
                
            } else {
                
                // Get a fresh context for each login. If you use the same context on multiple attempts
                //  (by commenting out the next line), then a previously successful authentication
                //  causes the next policy evaluation to succeed without testing biometry again.
                //  That's usually not what you want.
                context = LAContext()
                
                context.localizedCancelTitle = "Cancel"
                
                // First check if we have the needed hardware support.
                var error: NSError?
                if context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
                    
                    let reason = "Log in to your account"
                    context.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: reason ) { success, error in
                        
                        if success {
                            
                            // Move to the main thread because a state update triggers UI changes.
                            DispatchQueue.main.async { [unowned self] in
                                self.state = .loggedin
                            }
                            
                        } else {
                            print(error?.localizedDescription ?? "Failed to authenticate")
                            
                            // Fall back to a asking for username and password.
                            // ...
                        }
                    }
                } else {
                    print(error?.localizedDescription ?? "Can't evaluate policy")
                    
                    // Fall back to a asking for username and password.
                    // ...
                }
            }
        }
}
