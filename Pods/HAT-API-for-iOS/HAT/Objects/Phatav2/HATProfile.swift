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

public struct HATProfile: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `recordID` in JSON is `id`
     * `endpoint` in JSON is `endpoint`
     * `data` in JSON is `data`
     */
    private enum CodingKeys: String, CodingKey {
        
        case recordID = "id"
        case endpoint = "endpoint"
        case data = "data"
    }
    
    // MARK: - Variables
    
    /// The endpoint the data are coming from. Optional
    public var endpoint: String? = ""
    /// The record ID of the data. Optional
    public var recordID: String? = ""
    /// The data of the profile
    public var data: HATProfileData = HATProfileData()
    
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
    public init(from dict: Dictionary<String, JSON>) {
        
        self.init()
        
        self.initialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(dict: Dictionary<String, JSON>) {
        
        if let tempRecordId: String = (dict[CodingKeys.recordID.rawValue]?.stringValue) {
            
            recordID = tempRecordId
        }
        if let tempEndPoint: String = (dict[CodingKeys.endpoint.rawValue]?.stringValue) {
            
            endpoint = tempEndPoint
        }
        if let tempData: [String: JSON] = (dict[CodingKeys.data.rawValue]?.dictionaryValue) {
            
            data = HATProfileData(dict: tempData)
        }
    }
    
    // MARK: - HatApiType Protocol
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        self.initialize(dict: json.dictionaryValue)
    }
    
    // MARK: - JSON Mapper
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.endpoint.rawValue: self.endpoint ?? "",
            CodingKeys.recordID.rawValue: self.recordID ?? "",
            CodingKeys.data.rawValue: self.data.toJSON()
        ]
    }
}
