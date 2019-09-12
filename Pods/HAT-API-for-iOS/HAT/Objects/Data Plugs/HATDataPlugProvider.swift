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

// MARK: Struct

public struct HATDataPlugProvider: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `providerID` in JSON is `providerID`
     * `email` in JSON is `email`
     * `isEmailConfirmed` in JSON is `emailConfirmed`
     * `password` in JSON is `password`
     * `name` in JSON is `name`
     * `dateCreated` in JSON is `dateCreated`
     */
    private enum CodingKeys: String, CodingKey {
        
        case providerID = "id"
        case email = "email"
        case isEmailConfirmed = "emailConfirmed"
        case password = "password"
        case name = "name"
        case dateCreated = "dateCreated"
    }

    // MARK: - Variables
    
    /// The id of the provider
    public var providerID: String = ""
    /// The email of the provider
    public var email: String = ""
    /// A flag indicating if the provider's email is confirmed
    public var isEmailConfirmed: Bool = false
    /// The password
    public var password: String = ""
    /// The name of the provider
    public var name: String = ""
    /// The date created of the provider
    public var dateCreated: Int = 0
}
