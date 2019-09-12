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

// MARK: - Struct

public struct HATProfileContact: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `mobileNumber` in JSON is `mobile`
     * `landlineNumber` in JSON is `landline`
     * `primaryEmail` in JSON is `primaryEmail`
     * `alternativeEmail` in JSON is `alternativeEmail`
     */
    private enum CodingKeys: String, CodingKey {
        
        case mobileNumber = "mobile"
        case landlineNumber = "landline"
        case primaryEmail = "primaryEmail"
        case alternativeEmail = "alternativeEmail"
    }
    
    // MARK: - Variables

    /// The user's mobile number
    public var mobileNumber: String = ""
    /// The user's landline
    public var landlineNumber: String = ""
    /// The user's primary email
    public var primaryEmail: String = ""
    /// The user's alternative email
    public var alternativeEmail: String = ""
    
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
        
        if let tempMobile: String = (dict[CodingKeys.mobileNumber.rawValue]?.stringValue) {
            
            mobileNumber = tempMobile
        }
        if let tempLandline: String = (dict[CodingKeys.landlineNumber.rawValue]?.stringValue) {
            
            landlineNumber = tempLandline
        }
        if let tempPrimaryEmail: String = (dict[CodingKeys.primaryEmail.rawValue]?.stringValue) {
            
            primaryEmail = tempPrimaryEmail
        }
        if let tempAlternativeEmail: String = (dict[CodingKeys.alternativeEmail.rawValue]?.stringValue) {
            
            alternativeEmail = tempAlternativeEmail
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.mobileNumber.rawValue: self.mobileNumber,
            CodingKeys.landlineNumber.rawValue: self.landlineNumber,
            CodingKeys.primaryEmail.rawValue: self.primaryEmail,
            CodingKeys.alternativeEmail.rawValue: self.alternativeEmail
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
