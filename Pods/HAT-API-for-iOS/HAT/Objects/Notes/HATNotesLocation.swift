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

public struct HATNotesLocation: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `altitude` in JSON is `altitude`
     * `altitudeAccuracy` in JSON is `altitudeAccuracy`
     * `latitude` in JSON is `latitude`
     * `accuracy` in JSON is `accuracy`
     * `longitude` in JSON is `longitude`
     * `speed` in JSON is `speed`
     * `heading` in JSON is `heading`
     * `isShared` in JSON is `isShared`
     */
    enum CodingKeys: String, CodingKey {
        
        case altitude = "altitude"
        case altitudeAccuracy = "altitude_accuracy"
        case latitude = "latitude"
        case accuracy = "accuracy"
        case longitude = "longitude"
        case speed = "speed"
        case heading = "heading"
        case isShared = "shared"
    }
    
    // MARK: - Variables
    
    /// the altitude the at time of creating the note. This value is optional
    public var altitude: Double?
    /// the altitude accuracy at the time of creating the note. This value is optional
    public var altitudeAccuracy: Double?
    /// the latitude at the time of creating the note. Optional
    public var latitude: Double?
    /// the accuracy at the time of creating the note. Optional
    public var accuracy: Double?
    /// the longitude at the time of creating the note. Optional
    public var longitude: Double?
    /// the speed at the time of creating the note. This value is optional
    public var speed: Double?
    
    /// the heading at the time of creating the note. This value is optinal
    public var heading: String?
    
    /// is the location shared at the time of creating the note? This value is optional.
    public var isShared: Bool?
    
    // MARK: - Initialiser
    
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
        
        self.inititialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        // check for values and assign them if not empty
        if let tempAltitude: Double = dict[CodingKeys.altitude.rawValue]?.doubleValue {
            
            altitude = tempAltitude
        }
        
        if let tempAltitudeAccuracy: Double = dict[CodingKeys.altitudeAccuracy.rawValue]?.doubleValue {
            
            altitudeAccuracy = tempAltitudeAccuracy
        }
        
        if let tempLatitude: Double = dict[CodingKeys.latitude.rawValue]?.doubleValue {
            
            latitude = tempLatitude
        }
        if let tempHeading: String = dict[CodingKeys.heading.rawValue]?.stringValue {
            
            heading = tempHeading
        }
        
        if let tempShared: String = dict[CodingKeys.isShared.rawValue]?.stringValue, !tempShared.isEmpty {
            
            if let boolShared: Bool = Bool(tempShared) {
                
                isShared = boolShared
            }
        }
        if let tempAccuracy: Double = dict[CodingKeys.accuracy.rawValue]?.doubleValue {
            
            accuracy = tempAccuracy
        }
        if let tempLongitude: Double = dict[CodingKeys.longitude.rawValue]?.doubleValue {
            
            longitude = tempLongitude
        }
        if let tempSpeed: Double = dict[CodingKeys.speed.rawValue]?.doubleValue {
            
            speed = tempSpeed
        }
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
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
            
            CodingKeys.altitude.rawValue: self.altitude ?? 0,
            CodingKeys.altitudeAccuracy.rawValue: self.altitudeAccuracy ?? 0,
            CodingKeys.latitude.rawValue: self.latitude ?? 0,
            CodingKeys.heading.rawValue: self.heading ?? 0,
            CodingKeys.isShared.rawValue: String(describing: self.isShared),
            CodingKeys.accuracy.rawValue: self.accuracy ?? 0,
            CodingKeys.longitude.rawValue: self.longitude ?? 0,
            CodingKeys.speed.rawValue: self.speed ?? 0
        ]
    }
}
