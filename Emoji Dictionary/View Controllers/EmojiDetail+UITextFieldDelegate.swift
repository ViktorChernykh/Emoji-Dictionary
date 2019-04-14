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
        
        if textField.tag != 0 { return true }
        if ((textField.text?.count == 0) || (string == "\n")) { return true }
        return false
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        activeField = textField
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        let textFieldTag = textField.tag
        switch textFieldTag {
        case 0:
            nameTextField.becomeFirstResponder()
        case 1:
            descriptionTextField.becomeFirstResponder()
        case 2:
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
