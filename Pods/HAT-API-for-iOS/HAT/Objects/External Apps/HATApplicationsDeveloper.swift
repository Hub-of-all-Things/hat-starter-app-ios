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

// MARK: - Struct

public struct HATApplicationsDeveloper: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `developerID` in JSON is `id`
     * `name` in JSON is `name`
     * `url` in JSON is `url`
     * `country` in JSON is `country`
     */
    private enum CodingKeys: String, CodingKey {
        
        case developerID = "id"
        case name = "name"
        case url = "url"
        case country = "country"
    }
    
    // MARK: - Variables

    /// The unique ID of the developer
    public var developerID: String = ""
    /// The name of the developer
    public var name: String = ""
    /// The URL of the developer, probably a website or a blog
    public var url: String = ""
    /// The country the developer is from
    public var country: String = ""
}
