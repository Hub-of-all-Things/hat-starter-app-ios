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

public struct HATFeedNestedStructure: Codable {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `content` in JSON is `content`
     * `badge` in JSON is `badge`
     */
    private enum CodingKeys: String, CodingKey {
        
        case content
        case badge
    }
    
    // MARK: - Variables

    /// The content of the structure. Usually it is one word, like `Facebook`
    public var content: String = ""
    /// The detail to the content. It can be another word or a number, like the insights on the SHE feed
    public var badge: String = ""
}
