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

public struct HATFitbitStatsInformation: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `total` in JSON is `total`
     * `tracker` in JSON is `tracker`
     */
    private enum CodingKeys: String, CodingKey {
        
        case total
        case tracker
    }
    
    // MARK: - Variables

    /// The total stats. In case user is using multiple devices this will be the total from all of them
    public var total: HATFitbitStatsTotal = HATFitbitStatsTotal()
    /// The stats from the tracker used
    public var tracker: HATFitbitStatsTotal = HATFitbitStatsTotal()
}
