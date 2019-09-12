//
/**
 * Copyright (C) 2019 Dataswift Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import UIKit

// MARK: Extension

extension UIButton {
    
    /**
     Adds a border around the button with the specified color and width
     
     - parameter width: The desired width of the border
     - parameter color: The desired color of the border
     */
    func addBorder(width: CGFloat, color: UIColor) {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }

}
