/**
 * Copyright (C) 2018 HAT Data Exchange Ltd
 *
 * SPDX-License-Identifier: MPL2
 *
 * This file is part of the Hub of All Things project (HAT).
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/
 */

import Foundation

// MARK: Struct

/// A struct for everything that formats something
public struct HATFormatterHelper {
    
    // MARK: - Variables
    
    /// A static dateFormatter in order to use it accross the file. `DateFormatter`s are very expensive, it's a good practice to use one instance instead of creating it every time
    static let dateFormatter: DateFormatter = DateFormatter()
    
    // MARK: - String to Date formaters
    
    /**
     Formats a date to `ISO 8601` format
     
     - parameter date: The date to format
     
     - returns: The date as string represented in ISO format
     */
    public static func formatDateToISO(date: Date) -> String {
        
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        
        return dateFormatter.string(from: date)
    }
    
    /**
     Formats a string, usually in some ISO format representing a date, into a `Date`
     
     - parameter string: The string to format to a `Date`, usually in some ISO format
     
     - returns: An optional `Date` format, nil if all formats failed to produce a date
     */
    public static func formatStringToDate(string: String) -> Date? {
        
        // check if the string to format is empty
        guard !string.isEmpty else { return nil }
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        var date: Date? = dateFormatter.date(from: string)
        
        if date == nil {
            
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
            date = dateFormatter.date(from: string)
        }
        
        if date == nil {
            
            dateFormatter.dateFormat = "yyyy-MM-dd"
            date = dateFormatter.date(from: string)
        }
        
        // if date is nil try a different format and reformat
        if date == nil {
            
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            date = dateFormatter.date(from: string)
        }
        
        if date == nil {
            
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            date = dateFormatter.date(from: string)
        }
        
        // if date is nil try a different format, for twitter format and reformat
        if date == nil {
            
            dateFormatter.dateFormat = "E MMM dd HH:mm:ss Z yyyy"
            date = dateFormatter.date(from: string)
        }
        
        // if date is nil try a different format, unix time stamp
        if let timeStamp: Double = Double(string), date == nil {
                
            date = Date(timeIntervalSince1970: TimeInterval(timeStamp / 1000))
        }
        
        return date
    }
    
    // MARK: - UnixTimeStamp
    
    /**
     Formats a date to unix timestamp in seconds
     
     - parameter date: The date to convert to unix timestamp
     
     - returns: An optional `String` representing the unix timestamp, `nil` if the formatting failed
     */
    public static func formatDateToEpoch(date: Date) -> String? {
        
        // get the unix time stamp
        let timeElapsedSince1970: String = String(date.timeIntervalSince1970)
        let dotSeperatedArray: [String] = timeElapsedSince1970.components(separatedBy: ".")
        
        guard !dotSeperatedArray.isEmpty else { return nil }
        
        return dotSeperatedArray[0]
    }
    
    // MARK: - Convert from base64URL to base64
    
    /**
     Convert a `String` from base64Url to base64
     
     parameter stringToConvert: The string to be converted
     
     returns: The `stringToConvert` parameter represented in Base64 format
     */
    public static func fromBase64URLToBase64(stringToConvert: String) -> String {
        
        var convertedString: String = stringToConvert
        if convertedString.count % 4 == 2 {
            
            convertedString += "=="
        } else if convertedString.count % 4 == 3 {
            
            convertedString += "="
        }
        
        return convertedString.replacingOccurrences(of: "-", with: "+").replacingOccurrences(of: "_", with: "/")
    }
    
}
