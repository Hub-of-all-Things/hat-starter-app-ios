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

public struct HATLogEvent: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `message` in JSON is `message`
     * `actionCode` in JSON is `actionCode`
     */
    private enum CodingKeys: String, CodingKey {
        
        case message
        case actionCode
    }
    
    // MARK: - Variables
    
    /// The message we want to attach. Optional
    var message: String?
    /// The action that occured and we want to log
    var actionCode: String = ""
    
    // MARK: - Init
    
    /**
     Creates a `HATLogEvent` object based on the values passed as parameters
     
     - parameter message: An optional message to log
     - parameter actionCode: The actionCode occured
     
     - returns: A `HATLogEvent` already setup with the values passes as parameters
     */
    public init(message: String?, actionCode: String) {
        
        self.message = message
        self.actionCode = actionCode
    }
}
