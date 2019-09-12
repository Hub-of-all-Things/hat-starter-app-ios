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

public struct HATLocations: HATObject, HatApiType {
    
    // MARK: - Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `data` in JSON is `data`
     */
    private enum CodingKeys: String, CodingKey {
        
        case data
    }
    
    // MARK: - Variables
    
    /// The location data
    public var data: HATLocationsData = HATLocationsData()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary: JSON = JSON(fromCache)
        self.initialize(from: dictionary.dictionaryValue)
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - dictionary: The JSON file received from the HAT
     */
    public mutating func initialize(from dictionary: Dictionary<String, JSON>) {
        
        // this field will always have a value no need to use if let
        if let tempTables: [String: JSON] = dictionary[CodingKeys.data.rawValue]?.dictionaryValue {
            
            data = HATLocationsData(dict: tempTables)
        }
    }
    
    /**
     It initialises everything from the received JSON file from the HAT using V2 API
     
     - dictV2: The JSON file received from the HAT
     */
    public init(dict: Dictionary<String, JSON>) {
        
        // init optional JSON fields to default values
        self.init()
        
        self.initialize(from: dict)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.data.rawValue: self.data.toJSON()
        ]
    }
}
