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

public struct HATGoogleCalendarCreator: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `profileID` in JSON is `id`
     * `email` in JSON is `email`
     * `displayName` in JSON is `displayName`
     * `self` in JSON is `self`
     */
    private enum CodingKeys: String, CodingKey {
        
        case profileID = "id"
        case email = "email"
        case displayName = "displayName"
        case isInCurrentCalendar = "self"
    }
    
    // MARK: - Variables

    /// The creator's Profile ID, if available. It corresponds to the *id* field in the [People collection of the Google+ API](https://developers.google.com/+/web/api/rest/latest/people). Optional
    public var profileID: String?
    /// The creator's email address, if available. Optional
    public var email: String?
    /// The creator's name, if available. Optional
    public var displayName: String?
    /// Whether the creator corresponds to the calendar on which this copy of the event appears. Read-only. The default is False. Optional
    public var isInCurrentCalendar: Bool?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
