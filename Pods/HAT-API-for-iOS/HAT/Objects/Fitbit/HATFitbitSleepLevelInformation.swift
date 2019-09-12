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

public struct HATFitbitSleepLevelInformation: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `level` in JSON is `level`
     * `seconds` in JSON is `seconds`
     * `dateTime` in JSON is `dateTime`
     */
    private enum CodingKeys: String, CodingKey {
        
        case level
        case seconds
        case dateTime
    }
    
    // MARK: - Variables

    /// The sleep level, can be wake, rem etc
    public var level: String = ""
    /// The sleep duration in seconds
    public var seconds: Int = 0
    /// The sleep date time started in ISO format
    public var dateTime: String = ""
}
