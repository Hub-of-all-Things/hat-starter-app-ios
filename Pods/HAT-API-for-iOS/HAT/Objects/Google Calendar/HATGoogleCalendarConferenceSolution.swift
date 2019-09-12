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

public struct HATGoogleCalendarConferenceSolution: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `iconURL` in JSON is `iconUri`
     * `name` in JSON is `name`
     * `key` in JSON is `key`
     */
    private enum CodingKeys: String, CodingKey {
        
        case iconURL = "iconUri"
        case name = "name"
        case key = "key"
    }
    
    // MARK: - Variables

    /// The user-visible icon for this solution. Read-only. Optional
    public var iconURL: String?
    /// The user-visible name of this solution. Not localized. Read-only.
    public var name: String = ""
    /// The key which can uniquely identify the conference solution for this event. Optional
    public var key: HATGoogleCalendarSolutionKey?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
