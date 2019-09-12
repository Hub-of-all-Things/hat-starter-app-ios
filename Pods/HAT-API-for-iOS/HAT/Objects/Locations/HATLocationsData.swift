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

public struct HATLocationsData: HATObject, HatApiType {
    
    // MARK: - Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `altitude` in JSON is `altitude`
     * `latitude` in JSON is `latitude`
     * `course` in JSON is `course`
     * `horizontalAccuracy` in JSON is `horizontalAccuracy`
     * `verticalAccuracy` in JSON is `verticalAccuracy`
     * `longitude` in JSON is `longitude`
     * `speed` in JSON is `speed`
     * `dateCreated` in JSON is `dateCreated`
     * `dateCreatedLocal` in JSON is `dateCreatedLocal`
     * `floor` in JSON is `floor`
     */
    private enum CodingKeys: String, CodingKey {
        
        case altitude
        case latitude
        case course
        case horizontalAccuracy
        case verticalAccuracy
        case longitude
        case speed
        case dateCreated
        case dateCreatedLocal
        case floor
    }
    
    // MARK: - Variables
    
    /// The location's latitude
    public var latitude: Double = 0
    /// The location's longitude
    public var longitude: Double = 0
    /// The location's date created as unix time stamp
    public var dateCreated: Int = 0
    /// The location's date created as an ISO format
    public var dateCreatedLocal: String = ""
    /// The location's speed. Optional
    public var speed: Float?
    /// The location's floor. Optional
    public var floor: Int?
    /// The location's vertical accuracy. Optional
    public var verticalAccuracy: Float?
    /// The location's horizontal accuracy. Optional
    public var horizontalAccuracy: Float?
    /// The location's altitude. Optional
    public var altitude: Float?
    /// The location's course. Optional
    public var course: Float?
    
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
        
        // check for values and assign them if not empty
        if let tempAltitude: Float = dict[CodingKeys.altitude.rawValue]?.floatValue {
            
            altitude = tempAltitude
        }
        
        if let tempVerticalAccuracy: Float = dict[CodingKeys.verticalAccuracy.rawValue]?.floatValue {
            
            verticalAccuracy = tempVerticalAccuracy
        }
        
        if let tempHorizontalAccuracy: Float = dict[CodingKeys.horizontalAccuracy.rawValue]?.floatValue {
            
            horizontalAccuracy = tempHorizontalAccuracy
        }
        
        if let tempLatitude: Double = dict[CodingKeys.latitude.rawValue]?.doubleValue {
            
            latitude = tempLatitude
        }
        
        if let tempLongitude: Double = dict[CodingKeys.longitude.rawValue]?.doubleValue {
            
            longitude = tempLongitude
        }
        
        if let tempHeading: Float = dict[CodingKeys.course.rawValue]?.floatValue {
            
            course = tempHeading
        }
        
        if let tempFloor: Int = dict[CodingKeys.floor.rawValue]?.intValue {
            
            floor = tempFloor
        }
        
        if let tempSpeed: Float = dict[CodingKeys.speed.rawValue]?.floatValue {
            
            speed = tempSpeed
        }
        
        if let tempDateCreated: Int = dict[CodingKeys.dateCreated.rawValue]?.intValue {
            
            dateCreated = tempDateCreated
        }
        
        if let tempDateCreatedLocal: String = dict[CodingKeys.dateCreatedLocal.rawValue]?.stringValue {
            
            dateCreatedLocal = tempDateCreatedLocal
        }
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The Dictionary file received from the cache
     */
    public func initialize(fromCache: Dictionary<String, Any>) {
        
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            
            CodingKeys.altitude.rawValue: self.altitude ?? 0,
            CodingKeys.verticalAccuracy.rawValue: self.verticalAccuracy ?? 0,
            CodingKeys.horizontalAccuracy.rawValue: self.horizontalAccuracy ?? 0,
            CodingKeys.latitude.rawValue: self.latitude,
            CodingKeys.course.rawValue: self.course ?? 0,
            CodingKeys.floor.rawValue: self.floor ?? 0,
            CodingKeys.dateCreated.rawValue: self.dateCreated,
            CodingKeys.dateCreatedLocal.rawValue: self.dateCreatedLocal,
            CodingKeys.longitude.rawValue: self.longitude,
            CodingKeys.speed.rawValue: self.speed ?? 0
        ]
    }
}
