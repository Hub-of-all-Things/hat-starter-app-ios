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

public struct HATFitbitSleepSummaryCount: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `count` in JSON is `count`
     * `minutes` in JSON is `minutes`
     */
    private enum CodingKeys: String, CodingKey {
        
        case count
        case minutes
    }
    
    // MARK: - Variables

    /// Indicates how many times a particular type of sleep (asleep, restless, awake) occured
    public var count: Int = 0
    /// The total duration of the sleep level in minutes
    public var minutes: Int = 0
}
