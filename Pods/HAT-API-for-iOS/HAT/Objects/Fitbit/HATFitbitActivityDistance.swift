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

public struct HATFitbitActivityDistance: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `activity` in JSON is `activity`
     * `distance` in JSON is `distance`
     */
    private enum CodingKeys: String, CodingKey {
        
        case activity
        case distance
    }
    
    // MARK: - Variables

    /// The type of the activity
    public var activity: String = ""
    /// The total distance during the activity
    public var distance: Float = 0
}
