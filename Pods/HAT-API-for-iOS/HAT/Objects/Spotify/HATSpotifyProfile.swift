//
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

public struct HATSpotifyProfile: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `spotifyID` in JSON is `id`
     * `uri` in JSON is `uri`
     * `href` in JSON is `href`
     * `email` in JSON is `email`
     * `images` in JSON is `images`
     * `country` in JSON is `country`
     * `product` in JSON is `product`
     * `birthdate` in JSON is `birthdate`
     * `followers` in JSON is `followers`
     * `dateCreated` in JSON is `dateCreated`
     * `shouldDisplayName` in JSON is `display_name`
     * `externalUrls` in JSON is `external_urls`
     */
    private enum CodingKeys: String, CodingKey {
        
        case spotifyID = "id"
        case uri = "uri"
        case href = "href"
        case email = "email"
        case images = "images"
        case country = "country"
        case product = "product"
        case birthdate = "birthdate"
        case followers = "followers"
        case dateCreated = "dateCreated"
        case shouldDisplayName = "display_name"
        case externalUrls = "external_urls"
    }
    
    // MARK: - Variables

    /// The user's spotify ID
    public var spotifyID: String = ""
    /// The profile page for the particular user
    public var uri: String = ""
    /// The spotify's HREF
    public var href: String = ""
    /// User's email
    public var email: String = ""
    /// Images user has saved
    public var images: [HATSpotifyProfileImages] = []
    /// User's country
    public var country: String = ""
    /// The product user is registered
    public var product: String = ""
    /// User's birthdate
    public var birthdate: String = ""
    /// User's followers
    public var followers: HATSpotifyProfileFollowers = HATSpotifyProfileFollowers()
    /// Date user created the spotify account
    public var dateCreated: String = ""
    /// A flag indicating if user has choosen to share his name or not
    public var shouldDisplayName: String?
    /// Any external URLs user has added to the account
    public var externalUrls: HATSpotifyProfileExternalURLObject = HATSpotifyProfileExternalURLObject()
}
