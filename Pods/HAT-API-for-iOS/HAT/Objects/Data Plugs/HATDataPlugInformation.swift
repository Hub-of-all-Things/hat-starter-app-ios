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

public struct HATDataPlugInformation: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `plugID` in JSON is `uuid`
     * `providerID` in JSON is `providerId`
     * `dateCreated` in JSON is `crated`
     * `name` in JSON is `name`
     * `description` in JSON is `description`
     * `url` in JSON is `url`
     * `imageURL` in JSON is `illustrationUrl`
     * `passwordHash` in JSON is `passwordHash`
     * `isApproved` in JSON is `approved`
     * `shouldShowCheckMark` in JSON is `showCheckMark`
     */
    private enum CodingKeys: String, CodingKey {
        
        case plugID = "uuid"
        case providerID = "providerId"
        case dateCreated = "created"
        case name = "name"
        case description = "description"
        case url = "url"
        case imageURL = "illustrationUrl"
        case passwordHash = "passwordHash"
        case isApproved = "approved"
        case shouldShowCheckMark = "showCheckMark"
    }
    
    // MARK: - Variables

    /// The uuid of the `Data Plug`
    public var plugID: String = ""
    /// The provider ID for the `Data Plug`
    public var providerID: String = ""
    /// The date the `Data Plug` was created as unix time stamp
    public var dateCreated: Int = 0
    /// The name of the `Data Plug`
    public var name: String = ""
    /// A short description of the `Data Plug`. What it does and why it is a cool `Data Plug`
    public var description: String = ""
    /// The url of the `Data Plug`
    public var url: String = ""
    /// The image url of the `Data Plug`, in order to fetch it
    public var imageURL: String = ""
    /// The password hash value of the `Data Plug`
    public var passwordHash: String = ""
    /// A flag indicatinf if the `Data Plug` is approved for use
    public var isApproved: Bool = false
    
    /// A flag indicating if the `Data Plug` is connected, if it is show checkmark
    public var shouldShowCheckMark: Bool? = false
}
