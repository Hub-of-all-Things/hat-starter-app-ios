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

public struct HATPhataAddress: HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `streetAddress` in JSON is `streetAddress`
     * `houseNumber` in JSON is `houseNumber`
     * `postCode` in JSON is `postCode`
     */
    private enum CodingKeys: String, CodingKey {
        
        case streetAddress
        case houseNumber
        case postCode
    }
    
    // MARK: - Variables
    
    /// The user's street address
    public var streetAddress: String = ""
    /// The user's house number
    public var houseNumber: String = ""
    /// The user's post code
    public var postCode: String = ""

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
    public init(from dict: JSON) {
        
        self.initialize(dict: dict.dictionaryValue)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(dict: Dictionary<String, JSON>) {
        
        if let tempStreetAddress: String = (dict[CodingKeys.streetAddress.rawValue]?.stringValue) {
            
            streetAddress = tempStreetAddress
        }
        
        if let tempHouseNumber: String = (dict[CodingKeys.houseNumber.rawValue]?.stringValue) {
            
            houseNumber = tempHouseNumber
        }
        
        if let tempPostCode: String = (dict[CodingKeys.postCode.rawValue]?.stringValue) {
            
            postCode = tempPostCode
        }
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        self.initialize(dict: json.dictionaryValue)
    }
    
    // MARK: - To JSON
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.streetAddress.rawValue: self.streetAddress,
            CodingKeys.houseNumber.rawValue: self.houseNumber,
            CodingKeys.postCode.rawValue: self.postCode
        ]
    }
}
