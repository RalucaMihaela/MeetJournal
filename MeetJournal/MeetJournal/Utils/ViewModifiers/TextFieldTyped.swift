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

struct TextFieldTyped: UIViewRepresentable {
    let keyboardType: UIKeyboardType
    let returnVal: UIReturnKeyType
    let placeholder: String
    let tag: Int
    @Binding var text: String
    @Binding var isfocusAble: [Bool]
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.keyboardType = self.keyboardType
        textField.returnKeyType = self.returnVal
        textField.tag = self.tag
        textField.delegate = context.coordinator
        textField.autocorrectionType = .no
        textField.placeholder = placeholder
        textField.text = self.text
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            if self.isfocusAble[self.tag] {
                uiView.becomeFirstResponder()
            } else {
                uiView.resignFirstResponder()
            }
            
            if uiView.tag == 1 {
                uiView.text = self.text
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextFieldTyped
        
        init(_ textField: TextFieldTyped) {
            self.parent = textField
        }
        
        func updatefocus(textfield: UITextField) {
            textfield.becomeFirstResponder()
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            if let text = textField.text,
                let textRange = Range(range, in: text) {
                let updatedText = text.replacingCharacters(in: textRange,
                                                           with: string)
                self.parent.text = updatedText
            }
            return true
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            if parent.tag == 0 {
                parent.isfocusAble = [false, true, false]
                parent.text = textField.text ?? ""
            } else if parent.tag == 1 {
                parent.isfocusAble = [false, false, true]
                parent.text = textField.text ?? ""
            } else if parent.tag == 2 {
                parent.isfocusAble = [false, false,false]
                parent.text = textField.text ?? ""
            }
            return true
        }
    }
}
