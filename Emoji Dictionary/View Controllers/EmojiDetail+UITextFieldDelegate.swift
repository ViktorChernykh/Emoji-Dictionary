//
//  EmojiDetail+UITextFieldDelegate.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//
import  UIKit

// MARK: - UITextFieldDelegate
extension EmojiDetailViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        switch textField {
        case symbolTextField:
            if range.location > 0 { return false }
            
        case nameTextField:
            if range.location > 32 { return false }
            
        case descriptionTextField:
            if range.location > 80 { return false }
            
        case usageTextField:
            if range.location > 80 { return false }
            
        default:
            break
        }
        
        return true
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        switch textField {
        case symbolTextField:
            nameTextField.becomeFirstResponder()
        case nameTextField:
            descriptionTextField.becomeFirstResponder()
        case descriptionTextField:
            usageTextField.becomeFirstResponder()
        default:
            UIView.animate(withDuration: 0.2, animations: {
                self.scrollView.contentOffset = CGPoint.zero
                self.bottomConstraint.constant = CGFloat.zero
            })
        }

        activeField = nil
        return true
    }

}
