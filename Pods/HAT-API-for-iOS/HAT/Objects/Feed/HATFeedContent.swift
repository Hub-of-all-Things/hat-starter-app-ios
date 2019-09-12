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

public struct HATFeedContent: Codable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `text` in JSON is `text`
     * `media` in JSON is `media`
     * `nestedStructure` in JSON is `nestedStructure`
     */
    private enum CodingKeys: String, CodingKey {
        
        case text
        case media
        case nestedStructure
    }
    
    // MARK: - Variables
    
    /// The text content of the feed item in case of a message to display. Optional
    public var text: String?
    /// The media of the feed item in case if media(images/videos) to display. Optional
    public var media: [HATFeedMedia]?
    /// The nested structure if any of the feed item has a more complicated requirements. Currently used for insights. Optional
    public var nestedStructure: [String: [HATFeedNestedStructure]]?
    
    // MARK: - Initialiser
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
