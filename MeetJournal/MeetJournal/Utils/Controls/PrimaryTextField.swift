//
//  PrimaryTextField.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 01/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import SwiftUI

struct PrimaryTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(UIColor.accent2))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}
