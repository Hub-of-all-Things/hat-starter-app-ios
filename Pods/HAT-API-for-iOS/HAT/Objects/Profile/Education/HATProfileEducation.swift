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

public struct HATProfileEducation: HatApiType, Comparable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `highestAcademicQualification` in JSON is `highestAcademicQualification`
     * `data` in JSON is `data`
     * `recordID` in JSON is `recordID`
     */
    private enum CodingKeys: String, CodingKey {
        
        case highestAcademicQualification = "highestAcademicQualification"
        case data = "data"
        case recordID = "recordId"
    }
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATProfileEducation, rhs: HATProfileEducation) -> Bool {
        
        return (lhs.highestAcademicQualification == rhs.highestAcademicQualification && lhs.unixTimeStamp == rhs.unixTimeStamp)
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
    public static func < (lhs: HATProfileEducation, rhs: HATProfileEducation) -> Bool {
        
        return lhs.unixTimeStamp! < rhs.unixTimeStamp!
    }
    
    // MARK: - Variables
    
    /// User's highest academic qualification
    public var highestAcademicQualification: String = ""
    /// Record ID
    public var recordID: String = ""
    
    /// Date of the record created in Unix time stamp
    public var unixTimeStamp: Int?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        highestAcademicQualification = ""
        recordID = ""
        unixTimeStamp = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {
        
        if let data: [String: JSON] = (dict[CodingKeys.data.rawValue].dictionary) {
            
            highestAcademicQualification = (data[CodingKeys.highestAcademicQualification.rawValue]!.stringValue)
            if let time: String = (data["unixTimeStamp"]?.stringValue) {
                
                unixTimeStamp = Int(time)
            }
        }
        
        recordID = (dict[CodingKeys.recordID.rawValue].stringValue)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        if let tempQualification: Any = fromCache[CodingKeys.highestAcademicQualification.rawValue] {
            
            self.highestAcademicQualification = String(describing: tempQualification)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.highestAcademicQualification.rawValue: self.highestAcademicQualification,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
        
    }
}
