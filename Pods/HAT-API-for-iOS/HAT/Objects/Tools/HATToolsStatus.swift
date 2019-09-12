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

public struct HATToolsStatus: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `isAvailable` in JSON is `available`
     * `isEnabled` in JSON is `enabled`
     * `lastExecution` in JSON is `lastExecution`
     * `executionStarted` in JSON is `executionStarted`
     */
    private enum CodingKeys: String, CodingKey {
        
        case isAvailable = "available"
        case isEnabled = "enabled"
        case lastExecution = "lastExecution"
        case executionStarted = "executionStarted"
    }
    
    // MARK: - Variables

    /// A flag indicating if the tool is available to the end users
    public var isAvailable: Bool = false
    /// A flag indicating if the tool is enabled by the user
    public var isEnabled: Bool = false
    /// The last execution date in ISO format. Optional
    public var lastExecution: String?
    /// The date it last started running in ISO format. Optional
    public var executionStarted: String?
}
