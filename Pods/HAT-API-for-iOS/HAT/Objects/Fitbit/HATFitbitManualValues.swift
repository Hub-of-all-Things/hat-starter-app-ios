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

public struct HATFitbitManualValues: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `hasSteps` in JSON is `steps`
     * `hasCalories` in JSON is `calories`
     * `hasDistance` in JSON is `distance`
     */
    private enum CodingKeys: String, CodingKey {
        
        case hasSteps = "steps"
        case hasCalories = "calories"
        case hasDistance = "distance"
    }

    // MARK: - Variables
    
    /// The steps manual value
    public var hasSteps: Bool = false
    /// The caloried manual value
    public var hasCalories: Bool = false
    /// The distance manual value
    public var hasDistance: Bool = false
}
