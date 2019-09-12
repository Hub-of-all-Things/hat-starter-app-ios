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

public struct HATNotesPhoto: HATObject, HatApiType {

    // MARK: - JSON Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `link` in JSON is `link`
     * `source` in JSON is `source`
     * `caption` in JSON is `caption`
     * `shared` in JSON is `shared`
     */
    private enum CodingKeys: String, CodingKey {
        
        case link = "link"
        case source = "source"
        case caption = "caption"
        case isShared = "shared"
    }
    
    // MARK: - Variables
    
    /// the link to the photo. Optional
    public var link: String?
    /// the source of the photo. Optional
    public var source: String?
    /// the caption of the photo. Optional
    public var caption: String?
    
    /// if photo is shared. Optional
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
        
        // check if shared exists and if is empty
        if let tempShared: String = dict[CodingKeys.isShared.rawValue]?.string {
            
            if let boolResult: Bool = Bool(tempShared) {
                
                isShared = boolResult
            }
        }
        
        if let tempLink: String = dict[CodingKeys.link.rawValue]?.string {
            
            link = tempLink
        }
        
        if let tempSource: String = dict[CodingKeys.source.rawValue]?.string {
            
            source = tempSource
        }
        
        if let tempCaption: String = dict[CodingKeys.caption.rawValue]?.string {
            
            caption = tempCaption
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
            
            CodingKeys.isShared.rawValue: String(describing: self.isShared),
            CodingKeys.link.rawValue: self.link ?? "",
            CodingKeys.source.rawValue: self.source ?? "",
            CodingKeys.caption.rawValue: self.caption ?? ""
        ]
    }
}
