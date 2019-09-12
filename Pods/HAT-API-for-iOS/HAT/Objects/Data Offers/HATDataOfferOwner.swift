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

public struct HATDataOfferOwner: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `issuerID` in JSON is `id`
     * `email` in JSON is `email`
     * `nickName` in JSON is `nick`
     * `firstName` in JSON is `firstName`
     * `lastName` in JSON is `lastName`
     */
    private enum CodingKeys: String, CodingKey {
        
        case issuerID = "id"
        case email = "email"
        case nickName = "nick"
        case firstName = "firstName"
        case lastName = "lastName"
    }
    
    // MARK: - Variables

    /// The issuer ID of the `Data Offer`
    public var issuerID: String = ""
    /// The email of the issuer
    public var email: String = ""
    /// The nickname of the issuer
    public var nickName: String = ""
    /// The first name of the issuer
    public var firstName: String = ""
    /// The last name of the issuer
    public var lastName: String = ""
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
        issuerID = ""
        email = ""
        nickName = ""
        firstName = ""
        lastName = ""
    }
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - dictionary: The JSON file received
     */
    public init(dictionary: Dictionary<String, JSON>) {
        
        if let tempID: String = dictionary[HATDataOfferOwner.CodingKeys.issuerID.rawValue]?.string {
            
            issuerID = tempID
        }
        
        if let tempEmail: String = dictionary[HATDataOfferOwner.CodingKeys.email.rawValue]?.string {
            
            email = tempEmail
        }
        
        if let tempNick: String = dictionary[HATDataOfferOwner.CodingKeys.nickName.rawValue]?.string {
            
            nickName = tempNick
        }
        
        if let tempFirstName: String = dictionary[HATDataOfferOwner.CodingKeys.firstName.rawValue]?.string {
            
            firstName = tempFirstName
        }
        
        if let tempLastName: String = dictionary[HATDataOfferOwner.CodingKeys.lastName.rawValue]?.string {
            
            lastName = tempLastName
        }
    }
}
