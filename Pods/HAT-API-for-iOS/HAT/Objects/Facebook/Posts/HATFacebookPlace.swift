//
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

public struct HATFacebookPlace: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `placeID` in JSON is `id`
     * `name` in JSON is `name`
     * `location` in JSON is `location`
     */
    private enum CodingKeys: String, CodingKey {
        
        case placeID = "id"
        case name = "name"
        case location = "location"
    }
    
    // MARK: - Variables
    
    /// A unique id for the place
    public var placeID: String = ""
    /// The name of the place, eg. Five Guys
    public var name: String = ""
    /// The location object describing the location of the place, including latitude, longitude and more
    public var location: HATFacebookLocation = HATFacebookLocation()
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        placeID = ""
        name = ""
        location = HATFacebookLocation()
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.init()
        
        self.inititialize(dict: dictionary)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempPlaceID: String = dict[CodingKeys.placeID.rawValue]?.stringValue {
            
            placeID = tempPlaceID
        }
        if let tempName: String = dict[CodingKeys.name.rawValue]?.stringValue {
            
            name = tempName
        }
        if let tempLocation: [String: JSON] = dict[CodingKeys.location.rawValue]?.dictionaryValue {
            
            location = HATFacebookLocation(from: tempLocation)
        }
    }
    
    /**
     It initialises everything from the received JSON file from the cache
     
     - fromCache: The Dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary: JSON = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.placeID.rawValue: self.placeID,
            CodingKeys.name.rawValue: self.name,
            CodingKeys.location.rawValue: self.location.toJSON()
        ]
    }
    
}
