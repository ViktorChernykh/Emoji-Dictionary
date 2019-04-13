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
        guard let userInfo = notification.userInfo as? [String: AnyObject],
            let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        keyboardHeight = keyboardFrame.height
        let distanceToBottom = scrollView.frame.size.height - (activeField?.frame.origin.y)! - (activeField?.frame.size.height)!
        
        let scrollHight = keyboardHeight! - distanceToBottom
        if scrollHight > 0 {
            lastScroll = scrollHight
            UIView.animate(withDuration: 0.3, animations: {
                self.scrollView.contentOffset = CGPoint(x: 0, y: scrollHight + 10)
            })
            bottomconstraint.constant = baseBottomConstraint + 50
        }
    }
    
    // MARK: - @IBAction
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        symbolTextField.resignFirstResponder()
        nameTextField.resignFirstResponder()
        descriptionTextField.resignFirstResponder()
        usageTextField.resignFirstResponder()

        scrollView.contentOffset = CGPoint.zero
    }
    
}