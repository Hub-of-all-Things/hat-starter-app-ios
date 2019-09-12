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

internal extension UIView {
    
    /**
     Adds border to the view
     
     - parameter width: The width of the border
     - parameter color: The colof of the border
     */
    func addBorder(width: CGFloat, color: UIColor?) {
        
        self.layer.borderWidth = width
        self.layer.borderColor = color?.cgColor
    }
    
    /**
     Adds shadow to the view
     
     - parameter color: The color of the shadow
     - parameter shadowRadius: The radius of the shadow
     - parameter shadowOpacity: The opacity of the shadow
     - parameter width: The width of the shadow
     - parameter height: The height of the shadow
     */
    func addShadow(color: UIColor?, shadowRadius: CGFloat, shadowOpacity: Float, width: CGFloat, height: CGFloat) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = CGSize(width: width, height: height)
    }
}
