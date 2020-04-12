//
//  TextFieldTyped.swift
//  MeetJournal
//
//  Created by Raluca Ionescu on 02/04/2020.
//  Copyright © 2020 Raluca Ionescu. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

struct CustomTextField: UIViewRepresentable {
    let tag: Int
    let placeholder: String
    let keyboardType: UIKeyboardType
    let returnVal: UIReturnKeyType

    @Binding var text: String
    @Binding var activeFieldTag: Int?
    @Binding var isSecureTextEntry: Bool
    
    var totalFields: Int = 3
    var onEditingChanged: (Bool) -> Void = { _ in }

    var lastActiveFieldTag: Int? {

        // Return, if no active field
        // (It also means textFieldShouldReturn not called yet OR called for last field)
        guard let activeFieldTag = activeFieldTag else {
            return nil
        }
        // Return previous field
        if activeFieldTag > 0 {
            return activeFieldTag - 1
        }
        // Return, if no previous field
        return nil
    }

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = self.keyboardType
        textField.returnKeyType = self.returnVal
        textField.tag = self.tag

        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.isSecureTextEntry = isSecureTextEntry
        textField.text = self.text
        textField.placeholder = placeholder
        
        return textField
    }

    func updateUIView(_ textField: UITextField, context: Context) {
        if textField.text != self.text {
            textField.text = self.text
        }
        handleFirstResponder(textField)
        if textField.isSecureTextEntry != isSecureTextEntry {
            textField.isSecureTextEntry = isSecureTextEntry
        }
    }

    func handleFirstResponder(_ textField: UITextField) {

        // return if field is neither active nor last-active
        if tag != lastActiveFieldTag && tag != activeFieldTag {
            return
        }

        // return if field is already active
        if lastActiveFieldTag == activeFieldTag {
            return
        }

         //It creates problem in UI when we press the next button too fast and continuously on keyboard
        // Remove focus from last active field
//        if lastActiveFieldTag == tag {
//            textField.resignFirstResponder()
//            return
//        }

        // Give focus to active field
        print("TAG - \(tag) + ACITVE \(activeFieldTag)")
        if activeFieldTag == tag {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                textField.becomeFirstResponder()
                return
            }
            
        }
    }

    // Its called when pressing Next button on the keyboard
    // See textFieldShouldReturn
    func updateNextTag() {
        // There is no next field so set activeFieldTag to nil
        if tag + 1 == totalFields {
            activeFieldTag = nil
        } else {
            // Set next field tag as active
            activeFieldTag = tag + 1
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UITextFieldDelegate {

        var parent: CustomTextField

        init(_ textField: CustomTextField) {
            self.parent = textField
        }

        func updatefocus(textfield: UITextField) {
            textfield.becomeFirstResponder()
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {

            // Give focus to next field
            parent.updateNextTag()
            parent.text = textField.text ?? ""

            // If there is no next active field then dismiss the keyboard
            if parent.activeFieldTag == nil {
                DispatchQueue.main.async {
                    textField.resignFirstResponder()
                }
            }
            
            return true
        }

        func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
            DispatchQueue.main.async {
                // To enable user to click on any textField while another is active
                self.parent.activeFieldTag = self.parent.tag
                self.parent.onEditingChanged(true)
            }
            return true
        }

        func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
            DispatchQueue.main.async {
                self.parent.text = textField.text ?? ""
                self.parent.onEditingChanged(false)
            }
            return true
        }

        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text, let rangeExp = Range(range, in: text) {
                self.parent.text = text.replacingCharacters(in: rangeExp, with: string)
            }
            return true
        }
    }
}

