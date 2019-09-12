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

import UIKit

// MARK: Struct

public struct HATGoogleCalendar: HATObject, HATSocialFeedObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `endpoint` in JSON is `endpoint`
     * `recordID` in JSON is `recordId`
     * `data` in JSON is `data`
     */
    private enum CodingKeys: String, CodingKey {
        
        case endpoint = "endpoint"
        case recordID = "recordId"
        case data = "data"
    }
    
    // MARK: - HATSocialFeedObject protocol variables
    
    /// the last updated date, not used in that object. Optional
    public var protocolLastUpdate: Date?
    
    // MARK: - Variables
    
    /// The endpoint that gave the data
    public var endpoint: String = ""
    /// The HAT record ID
    public var recordID: String = ""
    /// The google calendar data
    public var data: HATGoogleCalendarData = HATGoogleCalendarData()
}
