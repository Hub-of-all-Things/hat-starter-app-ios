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

public struct HATUKSpecificInfo: HatApiType, Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATUKSpecificInfo, rhs: HATUKSpecificInfo) -> Bool {
        
        return (lhs.nationalInsuranceNumber == rhs.nationalInsuranceNumber && lhs.nhsNumber == rhs.nhsNumber && lhs.drivingLicenseNumber == rhs.drivingLicenseNumber && lhs.passportNumber == rhs.passportNumber && lhs.placeOfBirth == rhs.placeOfBirth && lhs.secondPassportNumber == rhs.secondPassportNumber && lhs.passportExpiryDate == rhs.passportExpiryDate && lhs.secondPassportExpiryDate == rhs.secondPassportExpiryDate)
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
    public static func < (lhs: HATUKSpecificInfo, rhs: HATUKSpecificInfo) -> Bool {
        
        return lhs.passportExpiryDate < rhs.passportExpiryDate
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `nationalInsuranceNumber` in JSON is `nationalInsuranceNumber`
     * `nhsNumber` in JSON is `nhsNumber`
     * `drivingLicenseNumber` in JSON is `drivingLicenseNumber`
     * `passportNumber` in JSON is `passportNumber`
     * `secondPassportNumber` in JSON is `secondPassportNumber`
     * `passportExpiryDate` in JSON is `passportExpiryDate`
     * `secondPassportExpiryDate` in JSON is `secondPassportExpiryDate`
     * `recordId` in JSON is `recordId`
     * `uniqueTaxReference` in JSON is `uniqueTaxReference`
     */
    private enum CodingKeys: String, CodingKey {
        
        case nationalInsuranceNumber = "nationalInsuranceNumber"
        case nhsNumber = "nhsNumber"
        case drivingLicenseNumber = "drivingLicenseNumber"
        case passportNumber = "passportNumber"
        case placeOfBirth = "placeOfBirth"
        case secondPassportNumber = "secondPassportNumber"
        case passportExpiryDate = "passportExpiryDate"
        case secondPassportExpiryDate = "secondPassportExpiryDate"
        case recordID = "recordId"
        case uniqueTaxReference = "uniqueTaxReference"
    }
    
    // MARK: - Variables
    
    /// User's national insurance number
    public var nationalInsuranceNumber: String = ""
    /// User's nhs number
    public var nhsNumber: String = ""
    /// User's driving license number
    public var drivingLicenseNumber: String = ""
    /// User's passport number
    public var passportNumber: String = ""
    /// User's place of birth
    public var placeOfBirth: String = ""
    /// User's second passport number
    public var secondPassportNumber: String = ""
    /// User's unique tax reference
    public var uniqueTaxReference: String = ""
    
    /// User's passport expiry date
    public var passportExpiryDate: Date = Date()
    /// User's second passport expiry date
    public var secondPassportExpiryDate: Date = Date()
    
    /// Record ID
    public var recordID: String = "-1"
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        nationalInsuranceNumber = ""
        nhsNumber = ""
        drivingLicenseNumber = ""
        passportNumber = ""
        placeOfBirth = ""
        secondPassportNumber = ""
        uniqueTaxReference = ""
        
        passportExpiryDate = Date()
        secondPassportExpiryDate = Date()
        
        recordID = "-1"
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {
        
        if let data: [String: JSON] = (dict["data"].dictionary) {
            
            self.initialize(fromCache: data)
        }
        
        recordID = (dict[CodingKeys.recordID.rawValue].stringValue)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        if let tempNationalInsuranceNumber: Any = fromCache[CodingKeys.nationalInsuranceNumber.rawValue] {
            
            nationalInsuranceNumber = String(describing: tempNationalInsuranceNumber)
        }
        
        if let tempUniqueTaxReference: Any = fromCache[CodingKeys.uniqueTaxReference.rawValue] {
            
            uniqueTaxReference = String(describing: tempUniqueTaxReference)
        }
        
        if let tempNhsNumber = fromCache[CodingKeys.nhsNumber.rawValue] {
            
            nhsNumber = String(describing: tempNhsNumber)
        }
        
        if let tempDrivingLicenseNumber: Any = fromCache[CodingKeys.drivingLicenseNumber.rawValue] {
            
            drivingLicenseNumber = String(describing: tempDrivingLicenseNumber)
        }
        
        if let tempPassportNumber: Any = fromCache[CodingKeys.passportNumber.rawValue] {
            
            passportNumber = String(describing: tempPassportNumber)
        }
        
        if let tempPlaceOfBirth: Any = fromCache[CodingKeys.placeOfBirth.rawValue] {
            
            placeOfBirth = String(describing: tempPlaceOfBirth)
        }
        
        if let tempSecondPassportNumber: Any = fromCache[CodingKeys.secondPassportNumber.rawValue] {
            
            secondPassportNumber = String(describing: tempSecondPassportNumber)
        }
        
        if let tempPassportExpiryDate: Any = fromCache[CodingKeys.passportExpiryDate.rawValue] {
            
            if let date: Int = Int(String(describing: tempPassportExpiryDate)) {
                
                passportExpiryDate = Date(timeIntervalSince1970: TimeInterval(date))
            }
        }
        
        if let tempSecondPassportNumber: Any = fromCache[CodingKeys.secondPassportExpiryDate.rawValue] {
            
            if let date: Int = Int(String(describing: tempSecondPassportNumber)) {
                
                secondPassportExpiryDate = Date(timeIntervalSince1970: TimeInterval(date))
            }
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.nationalInsuranceNumber.rawValue: self.nationalInsuranceNumber,
            CodingKeys.uniqueTaxReference.rawValue: self.uniqueTaxReference,
            CodingKeys.nhsNumber.rawValue: self.nhsNumber,
            CodingKeys.drivingLicenseNumber.rawValue: self.drivingLicenseNumber,
            CodingKeys.passportNumber.rawValue: self.passportNumber,
            CodingKeys.placeOfBirth.rawValue: self.placeOfBirth,
            CodingKeys.secondPassportNumber.rawValue: self.secondPassportNumber,
            CodingKeys.passportExpiryDate.rawValue: Int(HATFormatterHelper.formatDateToEpoch(date: self.passportExpiryDate)!)!,
            CodingKeys.secondPassportExpiryDate.rawValue: Int(HATFormatterHelper.formatDateToEpoch(date: self.secondPassportExpiryDate)!)!,
            "unixTimeStamp": Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
        
    }
}
