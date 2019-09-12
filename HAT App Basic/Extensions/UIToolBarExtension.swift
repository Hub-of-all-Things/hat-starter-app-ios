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

extension UIToolbar {

    // MARK: - Create Toolbar
    
    /**
     Creates the toolbar to attach to the keyboard if we have a saved userDomain
     */
    static func createToolBar(userDomain: String, width: CGFloat, viewController: UIViewController, selector: Selector) -> UIToolbar? {
        
        guard userDomain != "" else { return nil }
        
        // Create a button bar for the number pad
        let toolbar = UIToolbar()
        toolbar.frame = CGRect(x: 0, y: 0, width: width, height: 35)
        
        // Setup the buttons to be put in the system.
        let autofillButton = UIBarButtonItem(
            title: userDomain,
            style: .done,
            target: viewController,
            action: selector)
        
        autofillButton.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.white],
                                              for: .normal)
        toolbar.barTintColor = .mainColor
        toolbar.setItems([autofillButton], animated: true)
        
        return toolbar
    }
}
