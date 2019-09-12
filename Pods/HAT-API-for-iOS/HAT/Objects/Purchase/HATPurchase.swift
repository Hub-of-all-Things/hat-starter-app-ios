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

public struct HATPurchase: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `firstName` in JSON is `firstName`
     * `hasUserAcceptedTerms` in JSON is `termsAgreed`
     * `lastName` in JSON is `lastName`
     * `email` in JSON is `email`
     * `hatName` in JSON is `hatName`
     * `password` in JSON is `password`
     * `hatCluster` in JSON is `hatCluster`
     * `hatCountry` in JSON is `hatCountry`
     * `membership` in JSON is `membership`
     * `options` in JSON is `options`
     */
    private enum CodingKeys: String, CodingKey {
        
        case firstName = "firstName"
        case hasUserAcceptedTerms = "termsAgreed"
        case lastName = "lastName"
        case email = "email"
        case hatName = "hatName"
        case password = "password"
        case hatCluster = "hatCluster"
        case hatCountry = "hatCountry"
        case membership = "membership"
        case applicationID = "applicationId"
        case options = "options"
    }
    
    // MARK: - Variables
    
    /// First name of the new user
    public var firstName: String = ""
    /// Has new user agreed to terms
    public var hasUserAcceptedTerms: Bool = false
    /// Last name of the new user
    public var lastName: String = ""
    /// Email of the new user
    public var email: String = ""
    /// HAT name of the new user
    public var hatName: String = ""
    /// Password of the new user
    public var password: String = ""
    /// HAT cluster of the new user
    public var hatCluster: String = ""
    /// HAT country of the new user
    public var hatCountry: String = ""
    /// Membership info of the new user
    public var membership: HATPurchaseMembership = HATPurchaseMembership()
    /// The application ID that registers this hat
    public var applicationID: String = ""
    /// The options to mail subscriptions
    public var options: [String] = []
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
