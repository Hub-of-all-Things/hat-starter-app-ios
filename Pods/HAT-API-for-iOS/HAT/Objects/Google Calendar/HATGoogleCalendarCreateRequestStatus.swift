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

public struct HATGoogleCalendarCreateRequestStatus: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `statusCode` in JSON is `statusCode`
     */
    private enum CodingKeys: String, CodingKey {
        
        case statusCode
    }
    
    // MARK: - Variables

    /// The current status of the conference create request. Read-only. Optional
    /// The possible values are:
    ///
    /// - `pending`: the conference create request is still being processed.
    /// - `success`: the conference create request succeeded, the entry points are populated.
    /// - `failure`: the conference create request failed, there are no entry points.
    public var statusCode: String?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
