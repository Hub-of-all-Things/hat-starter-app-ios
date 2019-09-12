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

public struct HATNotes: HATObject, HatApiType {

    // MARK: - JSON Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `endpoint` in JSON is `endpoint`
     * `recordID` in JSON is `recordId`
     * `data` in JSON is `data`
     */
    private enum CodingKeys: String, CodingKey {
        
        case endpoint = "endpoint"
        case recordID = "recordId"
        case data = "data"
    }
    
    // MARK: - Variables
    
    /// the author data
    public var endpoint: String = ""
    
    /// the photo data
    public var recordID: String = ""
    
    /// the location data
    public var data: HATNotesData = HATNotesData()
    
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
        
        if let tempEndpoint: String = dict[CodingKeys.endpoint.rawValue]?.string {
            
            endpoint = tempEndpoint
        }
        
        if let tempRecordId: String = dict[CodingKeys.recordID.rawValue]?.string {
            
            recordID = tempRecordId
        }
        
        if let tempData: [String: JSON] = dict[CodingKeys.data.rawValue]?.dictionaryValue {
            
            data = HATNotesData(dict: tempData)
        }
    }
    
    // MARK: - HatApiType Protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [ CodingKeys.endpoint.rawValue: endpoint,
                 CodingKeys.recordID.rawValue: recordID,
                 CodingKeys.data.rawValue: data.toJSON()
        ]
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let dictionary: JSON = JSON(fromCache)
        self.inititialize(dict: dictionary.dictionaryValue)
    }
    
    // MARK: - Override decoding code to parse old notes as well
    
    public static func decode<T: HATObject>(from: Dictionary<String, JSON>) -> T? {
        
        let decoder: JSONDecoder = JSONDecoder()
        
        do {
            
            let data: Data = try JSON(from).rawData()
            let object: T = try decoder.decode(T.self, from: data)
            return object
        } catch {
            
            if from[CodingKeys.data.rawValue]?["notablesv1"].dictionaryValue != nil {
                
                let tst: T? = self.init(dict: from) as? T
                return tst!
            }
            
            return nil
        }
    }
}
