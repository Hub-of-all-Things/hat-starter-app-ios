//
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

public struct HATToolsTrigger: HATObject {
    
    // MARK: - Trigger types

    public enum HATTriggerTypes: String, Decodable {
        
        case periodic
        case individual
        case manual
    }
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `triggerType` in JSON is `triggerType`
     */
    private enum CodingKeys: String, CodingKey {
        
        case triggerType
    }
    
    // MARK: - Variables
    
    /// The type of the trigger. Can be periodic (like monthly, weekly), manual or individual
    public var triggerType: HATTriggerTypes.RawValue = ""
}
