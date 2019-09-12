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

public struct HATNotesData: HATObject, HatApiType {
        
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `authorV1` in JSON is `authorv1`
     * `photoV1` in JSON is `photov1`
     * `locationV1` in JSON is `locationv1`
     * `createdTime` in JSON is `created_time`
     * `publicUntil` in JSON is `public_until`
     * `updatedTime` in JSON is `updated_time`
     * `isShared` in JSON is `shared`
     * `isCurrentlyShared` in JSON is `currently_shared`
     * `sharedOn` in JSON is `sharedOn`
     * `message` in JSON is `message`
     * `kind` in JSON is `kind`
     */
    private enum CodingKeys: String, CodingKey {
        
        case authorV1 = "authorv1"
        case photoV1 = "photov1"
        case locationV1 = "locationv1"
        case createdTime = "created_time"
        case publicUntil = "public_until"
        case updatedTime = "updated_time"
        case isShared = "shared"
        case isCurrentlyShared = "currently_shared"
        case sharedOn = "shared_on"
        case message = "message"
        case kind = "kind"
    }
    
    // MARK: - Variables
    
    /// the author data
    public var authorV1: HATNotesAuthor = HATNotesAuthor()
    
    /// the photo data. Optional
    public var photoV1: HATNotesPhoto?
    
    /// the location data. Optional
    public var locationV1: HATNotesLocation?
    
    /// creation date
    public var createdTime: String = ""
    /// the date until this note will be public. Optional
    public var publicUntil: String?
    /// the updated time of the note
    public var updatedTime: String = ""
    
    /// if true this note is shared to facebook etc.
    public var isShared: Bool = false
    /// if true this note is shared to facebook etc.
    public var isCurrentlyShared: Bool = false
    
    /// If shared, where is it shared? Coma seperated string (don't know if it's optional or not)
    public var sharedOn: [String] = []
    /// the actual message of the note
    public var message: String = ""
    /// the kind of the note. 3 types available note, blog or list
    public var kind: String = ""
    
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
     */
    public mutating func inititialize(dict: Dictionary<String, JSON>) {
        
        let tempDict: Dictionary<String, JSON>
        if let temp: [String: JSON] = dict["notablesv1"]?.dictionaryValue {
            
            tempDict = temp
        } else {
            
            tempDict = dict
        }
        
        if let tempAuthorData: [String: JSON] = tempDict[CodingKeys.authorV1.rawValue]?.dictionary {
            
            authorV1 = HATNotesAuthor.init(dict: tempAuthorData)
        }
        
        if let tempPhotoData: [String: JSON] = tempDict[CodingKeys.photoV1.rawValue]?.dictionary {
            
            photoV1 = HATNotesPhoto.init(dict: tempPhotoData)
        }
        
        if let tempLocationData: [String: JSON] = tempDict[CodingKeys.locationV1.rawValue]?.dictionary {
            
            locationV1 = HATNotesLocation.init(dict: tempLocationData)
        }
        
        if let tempSharedOn: [JSON] = tempDict[CodingKeys.sharedOn.rawValue]?.arrayValue {
            
            for item: JSON in tempSharedOn {
                
                sharedOn.append(item.stringValue)
            }
        }
        
        if let tempPublicUntil: String = tempDict[CodingKeys.publicUntil.rawValue]?.string {
            
            publicUntil = tempPublicUntil
        }
        
        if let tempCreatedTime: String = tempDict[CodingKeys.createdTime.rawValue]?.string {
            
            createdTime = tempCreatedTime
        }
        
        if let tempUpdatedTime: String = tempDict[CodingKeys.updatedTime.rawValue]?.string {
            
            updatedTime = tempUpdatedTime
        }
        
        if let tempShared: Bool = tempDict[CodingKeys.isShared.rawValue]?.boolValue {
            
            isShared = tempShared
        }
        if let tempCurrentlyShared: Bool = tempDict[CodingKeys.isCurrentlyShared.rawValue]?.boolValue {
            
            isCurrentlyShared = tempCurrentlyShared
        }
        
        if let tempMessage: String = tempDict[CodingKeys.message.rawValue]?.string {
            
            message = tempMessage
        }
        
        if let tempKind: String = tempDict[CodingKeys.kind.rawValue]?.string {
            
            kind = tempKind
        }
    }
    
    // MARK: - HatApiType Protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.authorV1.rawValue: authorV1.toJSON(),
            CodingKeys.photoV1.rawValue: photoV1?.toJSON() ?? HATNotesPhoto().toJSON(),
            CodingKeys.locationV1.rawValue: locationV1?.toJSON() ?? HATNotesLocation().toJSON(),
            CodingKeys.createdTime.rawValue: createdTime,
            CodingKeys.publicUntil.rawValue: publicUntil ?? "",
            CodingKeys.updatedTime.rawValue: updatedTime,
            CodingKeys.isShared.rawValue: isShared,
            CodingKeys.isCurrentlyShared.rawValue: isCurrentlyShared,
            CodingKeys.sharedOn.rawValue: sharedOn,
            CodingKeys.message.rawValue: message,
            CodingKeys.kind.rawValue: kind
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
}
