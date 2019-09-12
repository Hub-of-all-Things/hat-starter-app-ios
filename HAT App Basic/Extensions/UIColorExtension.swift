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

extension UIColor {
    
    // MARK: - Staticly defined colors
    
    // swiftlint:disable object_literal
    
    /// The main color of the App
    static let mainColor: UIColor = UIColor(red: 74 / 255, green: 85 / 255, blue: 107 / 255, alpha: 1)
    /// The color that is being used in buttons or selectable views in general
    static let selectionColor: UIColor = UIColor(red: 98 / 255, green: 151 / 255, blue: 177 / 255, alpha: 1)
    /// The color used by labels in the sections of the she feed
    static let sectionTextColor: UIColor = UIColor(red: 154 / 255, green: 154 / 255, blue: 154 / 255, alpha: 1)
    /// The color used in placeholder text
    static let textFieldPlaceHolder: UIColor = UIColor(red: 206 / 255, green: 206 / 255, blue: 211 / 255, alpha: 1)
    /// The color used as a background gray color for many views accross the app
    static let hatGrayBackground: UIColor = UIColor(red: 245 / 255, green: 245 / 255, blue: 245 / 255, alpha: 1)
    /// The color used for a shadow in the profile buttons
    static let shadowColor: UIColor = UIColor(red: 55 / 255, green: 70 / 255, blue: 90 / 255, alpha: 1)
    /// The deselected gray for items that aren't user selectable
    static let hatDisabled: UIColor = UIColor(red: 224 / 255, green: 224 / 255, blue: 224 / 255, alpha: 1)
    
    // swiftlint:enable object_literal
}
