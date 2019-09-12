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

public struct HATProfileData: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `about` in JSON is `about`
     * `photo` in JSON is `photo`
     * `online` in JSON is `online`
     * `address` in JSON is `address`
     * `contact` in JSON is `contact`
     * `personal` in JSON is `personal`
     * `emergencyContact` in JSON is `emergencyContact`
     * `dateCreated` in JSON is `dateCreated`
     * `dateCreatedLocal` in JSON is `dateCreatedLocal`
     * `shared` in JSON is `shared`
     */
    private enum CodingKeys: String, CodingKey {
        
        case about = "about"
        case photo = "photo"
        case online = "online"
        case address = "address"
        case contact = "contact"
        case personal = "personal"
        case emergencyContact = "emergencyContact"
        case dateCreated = "dateCreated"
        case dateCreatedLocal = "dateCreatedLocal"
        case isShared = "shared"
    }
    
    // MARK: - Variables
    
    /// The website object of user's profile
    public var about: HATProfileAbout = HATProfileAbout()
    /// The nickname object of user's profile
    public var photo: HATProfilePhoto = HATProfilePhoto()
    /// The primary email address object of user's profile
    public var online: HATProfileOnline = HATProfileOnline()
    /// The youtube object of user's profile
    public var address: HATProfileAddress = HATProfileAddress()
    /// The global addres object of user's profile
    public var contact: HATProfileContact = HATProfileContact()
    /// The youtube object of user's profile
    public var personal: HATProfilePersonal = HATProfilePersonal()
    /// The global addres object of user's profile
    public var emergencyContact: HATProfileEmergencyContact = HATProfileEmergencyContact()
    
    /// The date the profile was created in unix time stamp. Optional
    public var dateCreated: Int?
    /// The date the profile was created in ISO format. Optional
    public var dateCreatedLocal: String?
    /// Is profile shared
    public var isShared: Bool = false
    
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
        
        self.init()
        
        self.initialize(dict: dict)
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dict: The JSON file received from the HAT
     */
    public mutating func initialize(dict: Dictionary<String, JSON>) {
        
        if let tempAbout: [String: JSON] = (dict[CodingKeys.about.rawValue]?.dictionaryValue) {
            
            about = HATProfileAbout(dict: tempAbout)
        }
        if let tempPhoto: [String: JSON] = (dict[CodingKeys.photo.rawValue]?.dictionaryValue) {
            
            photo = HATProfilePhoto(dict: tempPhoto)
        }
        if let tempOnline: [String: JSON] = (dict[CodingKeys.online.rawValue]?.dictionaryValue) {
            
            online = HATProfileOnline(dict: tempOnline)
        }
        if let tempAddress: [String: JSON] = (dict[CodingKeys.address.rawValue]?.dictionaryValue) {
            
            address = HATProfileAddress(dict: tempAddress)
        }
        if let tempContact: [String: JSON] = (dict[CodingKeys.contact.rawValue]?.dictionaryValue) {
            
            contact = HATProfileContact(dict: tempContact)
        }
        if let tempPersonal: [String: JSON] = (dict[CodingKeys.personal.rawValue]?.dictionaryValue) {
            
            personal = HATProfilePersonal(dict: tempPersonal)
        }
        if let tempEmergencyContact: [String: JSON] = (dict[CodingKeys.emergencyContact.rawValue]?.dictionaryValue) {
            
            emergencyContact = HATProfileEmergencyContact(dict: tempEmergencyContact)
        }
        if let tempDateCreated: Int = (dict[CodingKeys.dateCreated.rawValue]?.intValue) {
            
            dateCreated = tempDateCreated
        }
        if let tempDateCreatedLocal: String = (dict[CodingKeys.dateCreatedLocal.rawValue]?.stringValue) {
            
            dateCreatedLocal = tempDateCreatedLocal
        }
        if let tempShared: Bool = (dict[CodingKeys.isShared.rawValue]?.boolValue) {
            
            isShared = tempShared
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.about.rawValue: self.about.toJSON(),
            CodingKeys.photo.rawValue: self.photo.toJSON(),
            CodingKeys.online.rawValue: self.online.toJSON(),
            CodingKeys.address.rawValue: self.address.toJSON(),
            CodingKeys.contact.rawValue: self.contact.toJSON(),
            CodingKeys.personal.rawValue: self.personal.toJSON(),
            CodingKeys.emergencyContact.rawValue: self.emergencyContact.toJSON(),
            CodingKeys.dateCreated.rawValue: self.dateCreated ?? Date().timeIntervalSince1970,
            CodingKeys.dateCreatedLocal.rawValue: self.dateCreatedLocal ?? HATFormatterHelper.formatDateToISO(date: Date()),
            CodingKeys.isShared.rawValue: self.isShared
        ]
    }
    
    /**
     It initialises everything from the received Dictionary file from the cache
     
     - fromCache: The dictionary file received from the cache
     */
    public mutating func initialize(fromCache: Dictionary<String, Any>) {
        
        let json: JSON = JSON(fromCache)
        self.initialize(dict: json.dictionaryValue)
    }
}
