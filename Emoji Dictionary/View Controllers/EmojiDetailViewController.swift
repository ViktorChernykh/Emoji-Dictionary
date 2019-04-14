//
//  EmojiDetailViewController.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

class EmojiDetailViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    @IBOutlet weak var bottomconstraint: NSLayoutConstraint!

    var emoji: Emoji?
    var indexPath: IndexPath?
    
    var activeField: UITextField?
    var baseBottomConstraint: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        symbolTextField.delegate = self
        nameTextField.delegate = self
        descriptionTextField.delegate = self
        usageTextField.delegate = self
        
        baseBottomConstraint = bottomconstraint.constant
        
        view.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        registerForKeyboardNotifications()
        
        if emoji == nil {
            emoji = Emoji()
        }
        
        symbolTextField.text = emoji?.symbol
        nameTextField.text = emoji?.name
        descriptionTextField.text = emoji?.description
        usageTextField.text = emoji?.usage
        
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        removeKeyboardNotifications()
    }

    
    func areFieldsReady() -> Bool {
        return !symbolTextField.isEmpty && !nameTextField.isEmpty && !descriptionTextField.isEmpty && !usageTextField.isEmpty
    }
    
    func saveEmoji() {
        emoji?.symbol = symbolTextField.text ?? ""
        emoji?.name = nameTextField.text ?? ""
        emoji?.description = descriptionTextField.text ?? ""
        emoji?.usage = usageTextField.text ?? ""
    }

    func updateUI() {
        saveButton.isEnabled = areFieldsReady()
    }

    @IBAction func textChanged() {
        updateUI()
    }
}

// MARK: - Navigation
extension EmojiDetailViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        saveEmoji()
    }
}
