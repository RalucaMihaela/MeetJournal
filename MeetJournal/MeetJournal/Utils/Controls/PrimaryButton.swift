//
//  PrimaryButton.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 01/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import SwiftUI

struct PrimaryButton: ViewModifier {
    func body(content: Content) -> some View {
        return content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(
                Color(UIColor.accent1))
            .cornerRadius(15.0)
    }
}
