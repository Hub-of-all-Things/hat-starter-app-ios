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

extension String {
    
    // MARK: - Trim string
    
    /**
     Trims a given String
     
     - returns: trimmed String
     */
    func trimString() -> String {
        
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
    // MARK: - Calculate label height
    
    /**
     Calculates and returns the height a label will need to have for the given string
     
     - parameter maxWidth: The maximum allowed width of the label
     - parameter font: The font of the label
     
     - returns: The calculated height of the label with the font specified
     */
    func calculateLabelHeight(maxWidth: CGFloat, font: UIFont) -> CGFloat {
        
        let labelFrame = CGRect(x: 0, y: 0, width: maxWidth, height: 1)
        
        let label = UILabel(frame: labelFrame)
        label.isHidden = true
        label.numberOfLines = 0
        label.font = font
        label.text = self.trimString().trimmingCharacters(in: CharacterSet.newlines)
        
        return label.systemLayoutSizeFitting(labelFrame.size, withHorizontalFittingPriority: .defaultHigh, verticalFittingPriority: .defaultLow).height
    }
    
    /**
     Calculates and returns the height a label will need to have for the given string
     
     - parameter maxWidth: The maximum allowed width of the label
     - parameter font: The font of the label
     
     - returns: The calculated height of the label with the font specified
     */
    func calculateLabelWidth(maxHeight: CGFloat, font: UIFont) -> CGFloat {
        
        let labelFrame = CGRect(x: 0, y: 0, width: 100, height: maxHeight)
        
        let label = UILabel(frame: labelFrame)
        label.isHidden = true
        label.numberOfLines = 0
        label.font = font
        label.text = self.trimString().trimmingCharacters(in: CharacterSet.newlines)
        
        return label.systemLayoutSizeFitting(labelFrame.size, withHorizontalFittingPriority: .defaultLow, verticalFittingPriority: .defaultHigh).width
    }
    
    func search(_ regexPattern: String) -> Bool {
        
        if let regex = try? NSRegularExpression(pattern: regexPattern, options: []) {
            
            let string = self as NSString
            var previousLocation = 0
            let strings: [String] = regex.matches(in: self, options: [], range: NSRange(location: 0, length: string.length)).map { item in
                
                let newString = string.substring(with: NSRange(location: previousLocation, length: item.range.location - previousLocation))
                previousLocation = item.range.location
                return newString
            }
            
            return strings.count > 0
        }
        
        return false
    }
    
    // MARK: - Check email
    
    /**
     Checks if the email passed as parameter is a valid email address
          
     - returns: A bool value indicating if this is a valid email or not
     */
    func isValidEmail() -> Bool {
        
        let email: String = self.trimString()
        let emailRegEx: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest: NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // MARK: - Check HAT url
    
    /**
     Checks if a given string is a valid HAT URL
     
     - returns: Nil if it's success, else it gives the error as a `String`
     */
    func validateURL() -> String? {
        
        let hatUrlRegexPattern = "^[a-z][a-z0-9]{2,19}[a-z0-9]$"
        let specialCharRegexPattern = "[_~\\-!\"`¬|:;'#@$£%^&.,*()<>]+"
        let numberFirstRegexPattern = "^\\d"
        if (self.count < 4 || self.count > 21) {
            
            return "lengthError"
        } else if self != self.lowercased() {
            
            return "uppercaseError"
        } else if self.search(specialCharRegexPattern) {
            
            return "specialCharsError"
        } else if self.search(numberFirstRegexPattern) {
            
            return "mustStartWithLetterError"
        } else if !self.search(hatUrlRegexPattern) {
            
            return "hatNotValid"
        }
        
        return nil
    }
}
