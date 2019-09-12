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

public struct HATProfilePersonal: HATObject, HatApiType {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `title` in JSON is `title`
     * `gender` in JSON is `gender`
     * `ageGroup` in JSON is `ageGroup`
     * `middleName` in JSON is `middleName`
     * `preferredName` in JSON is `preferredName`
     * `lastName` in JSON is `lastName`
     * `nickName` in JSON is `nickName`
     * `firstName` in JSON is `firstName`
     * `birthDate` in JSON is `birthDate`
     */
    private enum CodingKeys: String, CodingKey {
        
        case title
        case gender
        case ageGroup
        case middleName
        case preferredName
        case lastName
        case nickName
        case firstName
        case birthDate
    }
    
    // MARK: - Variables
    
    /// The user's title
    public var title: String = ""
    /// The user's gender
    public var gender: String = ""
    /// The user's age group
    public var ageGroup: String = ""
    /// The user's middle name
    public var middleName: String = ""
    /// The user's preferred name
    public var preferredName: String = ""
    /// The user's last name
    public var lastName: String = ""
    /// The user's nick name
    public var nickName: String = ""
    /// The user's first name
    public var firstName: String = ""
    /// The user's birth date
    public var birthDate: String = ""
    
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
        
        if let tempTitle: String = (dict[CodingKeys.title.rawValue]?.stringValue) {
            
            title = tempTitle
        }
        if let tempGender: String = (dict[CodingKeys.gender.rawValue]?.stringValue) {
            
            gender = tempGender
        }
        if let tempAgeGroup: String = (dict[CodingKeys.ageGroup.rawValue]?.stringValue) {
            
            ageGroup = tempAgeGroup
        }
        if let tempMiddleName: String = (dict[CodingKeys.middleName.rawValue]?.stringValue) {
            
            middleName = tempMiddleName
        }
        if let tempPreferredName: String = (dict[CodingKeys.preferredName.rawValue]?.stringValue) {
            
            preferredName = tempPreferredName
        }
        if let tempLastName: String = (dict[CodingKeys.lastName.rawValue]?.stringValue) {
            
            lastName = tempLastName
        }
        if let tempNickName: String = (dict[CodingKeys.nickName.rawValue]?.stringValue) {
            
            nickName = tempNickName
        }
        if let tempFirstName: String = (dict[CodingKeys.firstName.rawValue]?.stringValue) {
            
            firstName = tempFirstName
        }
        if let tempBirthDate: String = (dict[CodingKeys.birthDate.rawValue]?.stringValue) {
            
            birthDate = tempBirthDate
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.title.rawValue: self.title,
            CodingKeys.gender.rawValue: self.gender,
            CodingKeys.ageGroup.rawValue: self.ageGroup,
            CodingKeys.middleName.rawValue: self.middleName,
            CodingKeys.preferredName.rawValue: self.preferredName,
            CodingKeys.lastName.rawValue: self.lastName,
            CodingKeys.nickName.rawValue: self.nickName,
            CodingKeys.firstName.rawValue: self.firstName,
            CodingKeys.birthDate.rawValue: self.birthDate
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
