//
//  EmojiDetail+Keyboard.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//
import  UIKit

extension EmojiDetailViewController {
    // register to receive notifications about the only appearance of the keyboard
    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // remove from registration
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    // MARK: - Custom Methods
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] else { return }
        guard let keyboardFrameValue = keyboardFrame as? NSValue else { return }
        
        let keyboardFrameSize = keyboardFrameValue.cgRectValue
        
        let distanceToBottom = scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
        
        let scrollHight = keyboardFrameSize.height + CGFloat(10) - distanceToBottom
        print(scrollHight, keyboardFrameSize.height, distanceToBottom)
        
        if scrollHight > 0 {
            UIView.animate(withDuration: 0.3, animations: {
                self.scrollView.contentOffset = CGPoint(x: 0, y: scrollHight)
                self.bottomConstraint.constant = keyboardFrameSize.height
            })
        }
    }
    
    // MARK: - @IBAction
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {       
        symbolTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        usageTextField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3, animations: {
            self.scrollView.contentOffset = CGPoint.zero
            self.bottomConstraint.constant = CGFloat(3)
        })
    }
    
}
