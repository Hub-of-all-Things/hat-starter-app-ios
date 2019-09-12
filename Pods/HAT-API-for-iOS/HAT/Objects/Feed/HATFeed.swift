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

public struct HATFeed: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `date` in JSON is `date`
     * `source` in JSON is `source`
     * `content` in JSON is `content`
     * `title` in JSON is `title`
     * `types` in JSON is `types`
     * `location` in JSON is `location`
     */
    private enum CodingKeys: String, CodingKey {
        
        case date
        case source
        case content
        case title
        case types
        case location
    }
    
    // MARK: - Variables
    
    /// The date of the feed object. It includes iso and unix formats
    public var date: HATFeedDate = HATFeedDate()
    /// The source of the feed item. Can be Facebook, twitter etc
    public var source: String = ""
    /// The content of the feed item. It includes any media files that may exist in a feed item as well as the main text of the feed item. Optional
    public var content: HATFeedContent?
    /// The title of the feed item as well as some subtitles if any
    public var title: HATFeedTitle = HATFeedTitle()
    /// The types of events, for google calendar, eg Event. Optional
    public var types: [String]?
    /// The location information of the feed item. Can either be a geographical place with name and info for its whereabouts or can be latitude longtitude. Optional
    public var location: HATFeedLocation?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
