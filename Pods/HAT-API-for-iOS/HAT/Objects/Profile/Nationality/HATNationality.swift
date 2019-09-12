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

public struct HATNationality: HatApiType, Comparable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `highestAcademicQualification` in JSON is `highestAcademicQualification`
     * `data` in JSON is `data`
     * `recordID` in JSON is `recordID`
     * `highestAcademicQualification` in JSON is `highestAcademicQualification`
     * `data` in JSON is `data`
     * `recordID` in JSON is `recordID`
     */
    private enum CodingKeys: String, CodingKey {
        
        case nationality = "nationality"
        case passportHeld = "passportHeld"
        case passportNumber = "passportNumber"
        case placeOfBirth = "placeOfBirth"
        case language = "language"
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
    public static func == (lhs: HATNationality, rhs: HATNationality) -> Bool {
        
        return (lhs.nationality == rhs.nationality && lhs.passportNumber == rhs.passportNumber && lhs.unixTimeStamp == rhs.unixTimeStamp)
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
    public static func < (lhs: HATNationality, rhs: HATNationality) -> Bool {
        
        return lhs.unixTimeStamp! < rhs.unixTimeStamp!
    }
    
    // MARK: - Variables
    
    /// User's nationality
    public var nationality: String = ""
    /// User's passport country of issue
    public var passportHeld: String = ""
    /// User's passport number
    public var passportNumber: String = ""
    /// User's place of birth
    public var placeOfBirth: String = ""
    /// User's language
    public var language: String = ""
    /// record ID
    public var recordID: String = ""
    
    /// The date the record has been created in unix time stamp format
    public var unixTimeStamp: Int?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        nationality = ""
        passportHeld = ""
        passportNumber = ""
        placeOfBirth = ""
        language = ""
        recordID = ""
        unixTimeStamp = nil
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {
        
        if let data = (dict["data"].dictionary) {
            
            nationality = (data[CodingKeys.nationality.rawValue]!.stringValue)
            passportHeld = (data[CodingKeys.passportHeld.rawValue]!.stringValue)
            passportNumber = (data[CodingKeys.passportNumber.rawValue]!.stringValue)
            placeOfBirth = (data[CodingKeys.placeOfBirth.rawValue]!.stringValue)
            language = (data[CodingKeys.language.rawValue]!.stringValue)
            if let time = (data["unixTimeStamp"]?.stringValue) {
                
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
        
        if let tempNationality: Any = fromCache[CodingKeys.nationality.rawValue] {
            
            self.nationality = String(describing: tempNationality)
        }
        
        if let tempPassportHeld: Any = fromCache[CodingKeys.passportHeld.rawValue] {
            
            self.passportHeld = String(describing: tempPassportHeld)
        }
        
        if let tempPassportNumber: Any = fromCache[CodingKeys.passportNumber.rawValue] {
            
            self.passportNumber = String(describing: tempPassportNumber)
        }
        
        if let tempPlaceOfBirth: Any = fromCache[CodingKeys.placeOfBirth.rawValue] {
            
            self.placeOfBirth = String(describing: tempPlaceOfBirth)
        }
        
        if let tempLanguage: Any = fromCache[CodingKeys.language.rawValue] {
            
            self.language = String(describing: tempLanguage)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.nationality.rawValue: self.nationality,
            CodingKeys.passportHeld.rawValue: self.passportHeld,
            CodingKeys.passportNumber.rawValue: self.passportNumber,
            CodingKeys.placeOfBirth.rawValue: self.placeOfBirth,
            CodingKeys.language.rawValue: self.language,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
    }
    
}
