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

public struct HATFeedTitle: Codable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `mediaURL` in JSON is `url`
     * `thumbnail` in JSON is `thumbnail`
     * `action` in JSON is `action`
     */
    private enum CodingKeys: String, CodingKey {
        
        case text
        case subtitle
        case action
    }
    
    // MARK: - Variables
    
    /// The text to display in the feed item
    public var text: String = ""
    /// The subtitle text in the feed item. Subtitle can be uses to display some more info like dates or a short description. Optional
    public var subtitle: String?
    /// The action of the feed item. This is used to load a predifined image in the app. Usually it's one word like `repeat` to indicate a retweet of a tweet.
    public var action: String?
}
