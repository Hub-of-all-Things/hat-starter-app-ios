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

public struct HATFitbitSleepLevels: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `details` in JSON is `data`
     * `summary` in JSON is `summary`
     */
    private enum CodingKeys: String, CodingKey {
        
        case details = "data"
        case summary = "summary"
    }
    
    // MARK: - Variables

    /// The sleep details, like the duration for each type of sleep (wake, rem etc) and the datetime
    public var details: [HATFitbitSleepLevelInformation] = []
    /// The sleep summary, like how and when the user user asleep, restlest etc
    public var summary: HATFitbitSleepLevelsSummary = HATFitbitSleepLevelsSummary()
}
