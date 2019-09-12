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

public struct HATGoogleCalendarProperties: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `sharedProperties` in JSON is `shared`
     * `privateProperties` in JSON is `private`
     */
    private enum CodingKeys: String, CodingKey {
        
        case sharedProperties = "shared"
        case privateProperties = "private"
    }
    
    // MARK: - Variables
    
    /// Properties that are shared between copies of the event on other attendees' calendars. Optional
    public var sharedProperties: [String: String]?
    /// Properties that are private to the copy of the event that appears on this calendar. Optional
    public var privateProperties: [String: String]?
    
    // MARK: - Initializers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
