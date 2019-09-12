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

public struct HATProfileEmergencyContact: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `relationship` in JSON is `relationship`
     * `lastName` in JSON is `lastName`
     * `mobile` in JSON is `mobile`
     * `firstName` in JSON is `firstName`
     */
    private enum CodingKeys: String, CodingKey {
        
        case relationship
        case lastName
        case mobile
        case firstName
    }
    
    // MARK: - Variables

    /// The type of relationship with the user
    public var relationship: String = ""
    /// The last name of the emergency contact
    public var lastName: String = ""
    /// The mobile number of the emergency contact
    public var mobile: String = ""
    /// The first name of the emergency contact
    public var firstName: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public init(dict: Dictionary<String, JSON>) {
        
        self.init()
        
        self.initialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(dict: Dictionary<String, JSON>) {
        
        if let tempRelationship: String = (dict[CodingKeys.relationship.rawValue]?.stringValue) {
            
            relationship = tempRelationship
        }
        if let tempLastName: String = (dict[CodingKeys.lastName.rawValue]?.stringValue) {
            
            lastName = tempLastName
        }
        if let tempMobile: String = (dict[CodingKeys.mobile.rawValue]?.stringValue) {
            
            mobile = tempMobile
        }
        if let tempFirstName: String = (dict[CodingKeys.firstName.rawValue]?.stringValue) {
            
            firstName = tempFirstName
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.relationship.rawValue: self.relationship,
            CodingKeys.lastName.rawValue: self.lastName,
            CodingKeys.mobile.rawValue: self.mobile,
            CodingKeys.firstName.rawValue: self.firstName
        ]
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        self.initialize(dict: json.dictionaryValue)
    }
}
