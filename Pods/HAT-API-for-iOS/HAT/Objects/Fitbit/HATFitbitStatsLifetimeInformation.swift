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

public struct HATFitbitStatsLifetimeInformation: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `steps` in JSON is `steps`
     * `floors` in JSON is `floors`
     * `distance` in JSON is `distance`
     * `activeScore` in JSON is `activeScore`
     * `caloriesOut` in JSON is `caloriesOut`
     */
    private enum CodingKeys: String, CodingKey {
        
        case steps
        case floors
        case distance
        case activeScore
        case caloriesOut
    }
    
    // MARK: - Variables

    /// The lifetime steps taken
    public var steps: Int = 0
    /// The lifetime floors climbed
    public var floors: Int = 0
    /// The lifetime distance
    public var distance: Float = 0
    /// The lifetime active score
    public var activeScore: Int = 0
    /// The lifetime calories burnt
    public var caloriesOut: Int = 0
}
