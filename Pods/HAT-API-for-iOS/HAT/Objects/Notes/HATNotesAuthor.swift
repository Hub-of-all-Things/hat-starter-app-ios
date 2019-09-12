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

public struct HATNotesAuthor: HATObject, HatApiType {

    // MARK: - JSON Fields
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `nickname` in JSON is `nick`
     * `name` in JSON is `name`
     * `photoURL` in JSON is `photo_url`
     * `phata` in JSON is `phata`
     * `authorID` in JSON is `authorID`
     */
    private enum CodingKeys: String, CodingKey {
        
        case nickname = "nick"
        case name = "name"
        case photoURL = "photo_url"
        case phata = "phata"
        case authorID = "id"
    }
    
    // MARK: - Variables
    
    /// the nickname of the author. Optional
    public var nickname: String?
    /// the name of the author. Optional
    public var name: String?
    /// the photo url of the author. Optional
    public var photoURL: String?
    /// the phata of the author. Required
    public var phata: String = ""
    
    /// the id of the author. Optional
    public var authorID: Int?
    
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
        
        // this field will always have a value no need to use if let
        if let tempPHATA: String = dict[CodingKeys.phata.rawValue]?.string {
            
            phata = tempPHATA
        }
        
        // check optional fields for value, if found assign it to the correct variable
        if let tempID: String = dict[CodingKeys.authorID.rawValue]?.stringValue, !tempID.isEmpty {
                
            if let intTempID: Int = Int(tempID) {
                
                authorID = intTempID
            }
        }
        
        if let tempNickName: String = dict[CodingKeys.nickname.rawValue]?.string {
            
            nickname = tempNickName
        }
        
        if let tempName: String = dict[CodingKeys.name.rawValue]?.string {
            
            name = tempName
        }
        
        if let tempPhotoURL: String = dict[CodingKeys.photoURL.rawValue]?.string {
            
            photoURL = tempPhotoURL
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
            
            CodingKeys.phata.rawValue: self.phata,
            CodingKeys.authorID.rawValue: self.authorID ?? "",
            CodingKeys.nickname.rawValue: self.nickname ?? "",
            CodingKeys.name.rawValue: self.name ?? "",
            CodingKeys.photoURL.rawValue: self.photoURL ?? ""
        ]
    }
}
