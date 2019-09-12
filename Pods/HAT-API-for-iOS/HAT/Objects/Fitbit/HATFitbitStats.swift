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

public struct HATFitbitStats: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `best` in JSON is `best`
     * `lifetime` in JSON is `lifetime`
     */
    private enum CodingKeys: String, CodingKey {
        
        case best
        case lifetime
    }
    
    // MARK: - Variables

    /// The best stats
    public var best: HATFitbitStatsInformation = HATFitbitStatsInformation()
    /// The lifetime stats
    public var lifetime: HATFitbitStatsLifetime = HATFitbitStatsLifetime()
}
