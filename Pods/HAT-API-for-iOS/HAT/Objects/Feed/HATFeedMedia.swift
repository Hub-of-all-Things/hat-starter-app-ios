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

public struct HATFeedMedia: Codable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `mediaURL` in JSON is `url`
     * `thumbnail` in JSON is `thumbnail`
     */
    private enum CodingKeys: String, CodingKey {
        
        case mediaURL = "url"
        case thumbnail = "thumbnail"
    }
    
    // MARK: - Variables
    
    /// The URL of the media. Optional
    public var mediaURL: String?
    /// The url of the media but in thumbnail size. Optional
    public var thumbnail: String?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
    
    /**
     Initializes the object from a url parameter
     
     - parameter url: The media URL to init with.
     */
    public init(url: String) {
        
        self.mediaURL = url
    }
}
