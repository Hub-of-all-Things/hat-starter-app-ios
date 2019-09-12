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

public struct HATLivingInfo: HatApiType, Comparable {
    
    // MARK: - Comparable protocol
    
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HATLivingInfo, rhs: HATLivingInfo) -> Bool {
        
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
    public static func < (lhs: HATLivingInfo, rhs: HATLivingInfo) -> Bool {
        
        return lhs.recordID < rhs.recordID
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `relationshipStatus` in JSON is `relationshipStatus`
     * `typeOfAccomodation` in JSON is `typeOfAccomodation`
     * `livingSituation` in JSON is `livingSituation`
     * `numberOfPeopleInHousehold` in JSON is `numberOfPeopleInHousehold`
     * `numberOfDecendants` in JSON is `numberOfDecendants`
     * `numberOfChildren` in JSON is `numberOfChildren`
     * `recordId` in JSON is `recordId`
     * `unixTimeStamp` in JSON is `unixTimeStamp`
     */
    private enum CodingKeys: String, CodingKey {
        
        case relationshipStatus
        case typeOfAccomodation
        case livingSituation
        case numberOfPeopleInHousehold
        case numberOfDecendants
        case numberOfChildren
        case recordId
        case unixTimeStamp
    }
    
    // MARK: - Variables
    
    /// User's relationship status
    public var relationshipStatus: String = ""
    /// User's type of accomodation
    public var typeOfAccomodation: String = ""
    /// User's livinga situation
    public var livingSituation: String = ""
    /// User's number of people in household
    public var numberOfPeopleInHousehold: String = ""
    /// User's number of decendatants
    public var numberOfDecendants: String = ""
    /// User's number of children
    public var numberOfChildren: String = ""
    /// The record ID
    public var recordID: String = "-1"
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        relationshipStatus = ""
        typeOfAccomodation = ""
        livingSituation = ""
        numberOfPeopleInHousehold = ""
        numberOfDecendants = ""
        numberOfChildren = ""
        recordID = "-1"
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(from dict: JSON) {
        
        if let data: [String: JSON] = (dict["data"].dictionary) {
            
            if let tempRelationshipStatus: String = (data[CodingKeys.relationshipStatus.rawValue]?.stringValue) {
                
                relationshipStatus = tempRelationshipStatus
            }
            
            if let tempTypeOfAccomodation: String = (data[CodingKeys.typeOfAccomodation.rawValue]?.stringValue) {
                
                typeOfAccomodation = tempTypeOfAccomodation
            }
            
            if let tempLivingSituation: String = (data[CodingKeys.livingSituation.rawValue]?.stringValue) {
                
                livingSituation = tempLivingSituation
            }
            
            if let tempNumberOfPeopleInHousehold: String = (data[CodingKeys.numberOfPeopleInHousehold.rawValue]?.stringValue) {
                
                numberOfPeopleInHousehold = tempNumberOfPeopleInHousehold
            }
            
            if let tempNumberOfDecendants: String = (data[CodingKeys.numberOfDecendants.rawValue]?.stringValue) {
                
                numberOfDecendants = tempNumberOfDecendants
            }
            
            if let tempNumberOfChildren: String = (data[CodingKeys.numberOfChildren.rawValue]?.stringValue) {
                
                numberOfChildren = tempNumberOfChildren
            }
        }
        
        recordID = (dict[CodingKeys.recordId.rawValue].stringValue)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        if let tempRelationshipStatus: Any = fromCache[CodingKeys.relationshipStatus.rawValue] {
            
            relationshipStatus = String(describing: tempRelationshipStatus)
        }
        
        if let tempTypeOfAccomodation: Any = fromCache[CodingKeys.typeOfAccomodation.rawValue] {
            
            typeOfAccomodation = String(describing: tempTypeOfAccomodation)
        }
        
        if let tempLivingSituation: Any = fromCache[CodingKeys.livingSituation.rawValue] {
            
            livingSituation = String(describing: tempLivingSituation)
        }
        
        if let tempNumberOfPeopleInHousehold: Any = fromCache[CodingKeys.numberOfPeopleInHousehold.rawValue] {
            
            numberOfPeopleInHousehold = String(describing: tempNumberOfPeopleInHousehold)
        }
        
        if let tempNumberOfDecendants: Any = fromCache[CodingKeys.numberOfDecendants.rawValue] {
            
            numberOfDecendants = String(describing: tempNumberOfDecendants)
        }
        
        if let tempNumberOfChildren: Any = fromCache[CodingKeys.numberOfChildren.rawValue] {
            
            numberOfChildren = String(describing: tempNumberOfChildren)
        }
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.relationshipStatus.rawValue: self.relationshipStatus,
            CodingKeys.typeOfAccomodation.rawValue: self.typeOfAccomodation,
            CodingKeys.livingSituation.rawValue: self.livingSituation,
            CodingKeys.numberOfPeopleInHousehold.rawValue: self.numberOfPeopleInHousehold,
            CodingKeys.numberOfDecendants.rawValue: self.numberOfDecendants,
            CodingKeys.numberOfChildren.rawValue: self.numberOfChildren,
            CodingKeys.unixTimeStamp.rawValue: Int(HATFormatterHelper.formatDateToEpoch(date: Date())!)!
        ]
        
    }
}
