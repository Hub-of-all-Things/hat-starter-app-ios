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

public struct HATFeedAddress: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `name` in JSON is `name`
     * `city` in JSON is `city`
     * `country` in JSON is `country`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name
        case city
        case country
    }
    
    // MARK: - Variables

    /// Tha name of the address, in case it's just a string like google calendar. Optional
    public var name: String?
    /// Tha name of the city, in case it's just a string like google calendar. Optional
    public var city: String?
    /// Tha name of the country, in case it's just a string like google calendar. Optional
    public var country: String?
}
