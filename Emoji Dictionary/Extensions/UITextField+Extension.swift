//
//  UITextField+Extension.swift
//  Emoji Dictionary
//
//  Created by Viktor on 12/04/2019.
//  Copyright © 2019 Viktor Chernykh. All rights reserved.
//

import UIKit

extension UITextField {
    var isEmpty: Bool {
        return text?.isEmpty ?? true
    }
}
