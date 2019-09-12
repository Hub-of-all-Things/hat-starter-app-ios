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

import SwiftyJSON

// MARK: Struct

public struct HATFitbitHeartRateZone: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `max` in JSON is `max`
     * `min` in JSON is `min`
     * `name` in JSON is `name`
     * `minutes` in JSON is `minutes`
     */
    private enum CodingKeys: String, CodingKey {
        
        case max
        case min
        case name
        case minutes
    }
    
    // MARK: - Variables

    /// The max heart rate achieved
    public var max: Int = 0
    /// The min heart rate achieved
    public var min: Int = 0
    /// The name of the activity
    public var name: String = ""
    /// The duration of the activity in minutes
    public var minutes: Int = 0
    
    // MARK: - Initialisers
    
    /**
     It initialises everything from the received JSON file from the HAT
     
     - from: The JSON file received
     */
    init(from: JSON) {
        
        let dictionary: [String: JSON] = self.extractContent(from: from)
        guard let tempHeartRateZone: HATFitbitHeartRateZone = HATFitbitHeartRateZone.decode(from: dictionary) else { return }
        
        self = tempHeartRateZone
    }
    
    // MARK: - Extract content
    
    /**
     It extracts the content to parse
     
     - from: The JSON file received
     */
    public func extractContent(from: JSON) -> Dictionary<String, JSON> {
        
        return [:]
    }
}
