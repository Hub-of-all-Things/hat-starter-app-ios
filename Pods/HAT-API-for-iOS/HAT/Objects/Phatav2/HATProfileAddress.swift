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

public struct HATProfileAddress: HATObject, HatApiType {

    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `city` in JSON is `city`
     * `county` in JSON is `county`
     * `country` in JSON is `country`
     */
    private enum CodingKeys: String, CodingKey {
        
        case city
        case county
        case country
    }
    
    // MARK: - Variables
    
    /// The user's city
    public var city: String = ""
    /// The user's county
    public var county: String = ""
    /// The user's country
    public var country: String = ""
    
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
        
        if let tempCity: String = (dict[CodingKeys.city.rawValue]?.stringValue) {
            
            city = tempCity
        }
        if let tempCounty: String = (dict[CodingKeys.county.rawValue]?.stringValue) {
            
            county = tempCounty
        }
        if let tempCountry: String = (dict[CodingKeys.country.rawValue]?.stringValue) {
            
            country = tempCountry
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.city.rawValue: self.city,
            CodingKeys.county.rawValue: self.county,
            CodingKeys.country.rawValue: self.country
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
