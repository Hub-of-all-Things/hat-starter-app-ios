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

public struct HATFacebookLocation: HatApiType, HATObject {

    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `zip` in JSON is `zip`
     * `city` in JSON is `city`
     * `street` in JSON is `street`
     * `country` in JSON is `country`
     * `latitude` in JSON is `latitude`
     * `longitude` in JSON is `longitude`
     */
    private enum CodingKeys: String, CodingKey {
        
        case zip
        case city
        case street
        case country
        case latitude
        case longitude
    }
    
    // MARK: - Variables
    
    public var zip: String = ""
    public var city: String = ""
    public var street: String = ""
    public var country: String = ""
    public var latitude: Double = 0
    public var longitude: Double = 0
    
    // MARK: - Initializers

    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(from dictionary: Dictionary<String, JSON>) {
        
        self.inititialize(dict: dictionary)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        if let tempZip: String = dict[CodingKeys.zip.rawValue]?.stringValue {
            
            zip = tempZip
        }
        if let tempCity: String = dict[CodingKeys.city.rawValue]?.stringValue {
            
            city = tempCity
        }
        if let tempStreet: String = dict[CodingKeys.street.rawValue]?.stringValue {
            
            street = tempStreet
        }
        if let tempCountry: String = dict[CodingKeys.country.rawValue]?.stringValue {
            
            country = tempCountry
        }
        if let tempLatitude: Double = dict[CodingKeys.latitude.rawValue]?.doubleValue {
            
            latitude = tempLatitude
        }
        if let tempLongitude: Double = dict[CodingKeys.longitude.rawValue]?.doubleValue {
            
            longitude = tempLongitude
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
            
            CodingKeys.zip.rawValue: self.zip,
            CodingKeys.city.rawValue: self.city,
            CodingKeys.country.rawValue: self.country,
            CodingKeys.street.rawValue: self.street,
            CodingKeys.latitude.rawValue: self.latitude,
            CodingKeys.longitude.rawValue: self.longitude
        ]
    }
}
