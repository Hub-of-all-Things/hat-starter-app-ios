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

public struct HATGoogleCalendarDate: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `date` in JSON is `date`
     * `dateTime` in JSON is `dateTime`
     * `timeZone` in JSON is `timeZone`
     */
    private enum CodingKeys: String, CodingKey {
        
        case dateOnly = "date"
        case iso = "dateTime"
        case timeZone = "timeZone"
    }

    // MARK: - Variables
    
    /// The date, in the format "yyyy-mm-dd", if this is an all-day event. Optional
    public var dateOnly: String?
    /// The time, as a combined date-time value (formatted according to RFC3339). A time zone offset is required unless a time zone is explicitly specified in *timeZone*. Optional
    public var iso: String?
    /// The time zone in which the time is specified. (Formatted as an IANA Time Zone Database name, e.g. "Europe/Zurich".) For recurring events this field is required and specifies the time zone in which the recurrence is expanded. For single events this field is optional and indicates a custom time zone for the event start/end. Optional
    public var timeZone: String?
    
    // MARK: - Initialisers
    
    /**
     The default initialiser. Initialises everything to default values.
     */
    public init() {
        
    }
}
