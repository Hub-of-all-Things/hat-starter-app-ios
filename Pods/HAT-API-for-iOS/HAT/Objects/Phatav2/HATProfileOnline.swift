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

public struct HATProfileOnline: HATObject, HatApiType {

    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `blog` in JSON is `blog`
     * `google` in JSON is `google`
     * `twitter` in JSON is `twitter`
     * `website` in JSON is `website`
     * `youtube` in JSON is `youtube`
     * `facebook` in JSON is `facebook`
     * `linkedin` in JSON is `linkedin`
     */
    private enum CodingKeys: String, CodingKey {
        
        case blog
        case google
        case twitter
        case website
        case youtube
        case facebook
        case linkedin
    }
    
    // MARK: - Variables
    
    /// The user's blog address
    public var blog: String = ""
    /// The user's google address
    public var google: String = ""
    /// The user's twitter address
    public var twitter: String = ""
    /// The user's website address
    public var website: String = ""
    /// The user's youtube address
    public var youtube: String = ""
    /// The user's facebook address
    public var facebook: String = ""
    /// The user's linkedin address
    public var linkedin: String = ""
    
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
        
        if let tempBlog: String = (dict[CodingKeys.blog.rawValue]?.stringValue) {
            
            blog = tempBlog
        }
        if let tempGoogle: String = (dict[CodingKeys.google.rawValue]?.stringValue) {
            
            google = tempGoogle
        }
        if let tempTwitter: String = (dict[CodingKeys.twitter.rawValue]?.stringValue) {
            
            twitter = tempTwitter
        }
        if let tempWebsite: String = (dict[CodingKeys.website.rawValue]?.stringValue) {
            
            website = tempWebsite
        }
        if let tempYoutube: String = (dict[CodingKeys.youtube.rawValue]?.stringValue) {
            
            youtube = tempYoutube
        }
        if let tempFacebook: String = (dict[CodingKeys.facebook.rawValue]?.stringValue) {
            
            facebook = tempFacebook
        }
        if let tempLinkedin: String = (dict[CodingKeys.linkedin.rawValue]?.stringValue) {
            
            linkedin = tempLinkedin
        }
    }
    
    // MARK: - HatApiType protocol
    
    /**
     Returns the object as Dictionary, JSON
     
     - returns: Dictionary<String, String>
     */
    public func toJSON() -> Dictionary<String, Any> {
        
        return [
            CodingKeys.blog.rawValue: self.blog,
            CodingKeys.google.rawValue: self.google,
            CodingKeys.twitter.rawValue: self.twitter,
            CodingKeys.website.rawValue: self.website,
            CodingKeys.youtube.rawValue: self.youtube,
            CodingKeys.facebook.rawValue: self.facebook,
            CodingKeys.linkedin.rawValue: self.linkedin
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
