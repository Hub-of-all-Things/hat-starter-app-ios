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

public struct HATFitbitStatsTotalStats: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `date` in JSON is `date`
     * `value` in JSON is `value`
     */
    private enum CodingKeys: String, CodingKey {
        
        case date
        case value
    }

    // MARK: - Variables
    
    /// The date of the stats in an yyyy-MM-dd format
    public var date: String = ""
    /// The value of the stats
    public var value: Float = 0
}
