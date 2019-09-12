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

import SwiftyJSON

// MARK: Struct

public struct HATEmployementStatus: HatApiType, Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATEmployementStatus, rhs: HATEmployementStatus) -> Bool {
        
        return (lhs.recordID == rhs.recordID)
    }
    
    /// Returns a Boolean value indicating whether the value of the first
    /// argument is less than that of the second argument.
    ///
    /// This function is the only requirement of the `Comparable` protocol. The
    /// remainder of the relational operator functions are implemented by the
    /// standard library for any type that conforms to `Comparable`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func < (lhs: HATEmployementStatus, rhs: HATEmployementStatus) -> Bool {
        
        return lhs.recordID < rhs.recordID
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `status` in JSON is `status`
     * `recordID` in JSON is `recordId`
     */
    private enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case recordID = "recordId"
    }
    
    // MARK: - Variables
    
    /// Employment status
    public var status: String = ""
    /// The record ID
    public var recordID: String = "-1"
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        status = ""
        recordID = "-1"
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {
        
        if let data: [String: JSON] = (dict["data"].dictionary) {
            
            if let tempStatus: String = (data[CodingKeys.status.rawValue]?.stringValue) {
                
                status = tempStatus
            }
        }
        
        recordID = (dict[CodingKeys.recordID.rawValue].stringValue)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        if let tempStatus: Any = fromCache[CodingKeys.status.rawValue] {
            
            self.status = String(describing: tempStatus)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.status.rawValue: self.status,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
        
    }
}
