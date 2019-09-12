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

public struct HATFitbitWeight: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `bmi` in JSON is `bmi`
     * `fat` in JSON is `fat`
     * `date` in JSON is `date`
     * `time` in JSON is `time`
     * `logId` in JSON is `logId`
     * `source` in JSON is `source`
     * `weight` in JSON is `weight`
     */
    private enum CodingKeys: String, CodingKey {
        
        case bmi
        case fat
        case date
        case time
        case logId
        case source
        case weight
    }
    
    // MARK: - Variables

    /// User's BMI
    public var bmi: Float = 0
    /// User's fat
    public var fat: Float = 0
    /// User's weight date recorded in yyyy-MM-dd format
    public var date: String = ""
    /// User's weight time recorder in HH:MM:SS format
    public var time: String = ""
    /// Weight log ID
    public var logId: Int = 0
    /// User's weight source, most probably API
    public var source: String = ""
    /// User's weight
    public var weight: Float = 0
}
