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

public struct HATFitbitSleepLevelsSummary: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `awake` in JSON is `awake`
     * `asleep` in JSON is `asleep`
     * `restless` in JSON is `restless`
     */
    private enum CodingKeys: String, CodingKey {
        
        case awake
        case asleep
        case restless
    }
    
    // MARK: - Variables

    /// The awake state of sleep
    public var awake: HATFitbitSleepSummaryCount = HATFitbitSleepSummaryCount()
    /// The asleep state of sleep
    public var asleep: HATFitbitSleepSummaryCount = HATFitbitSleepSummaryCount()
    /// The restless state of sleep
    public var restless: HATFitbitSleepSummaryCount = HATFitbitSleepSummaryCount()
}
