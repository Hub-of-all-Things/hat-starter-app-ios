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

public struct HATProfileBundleEndpoints: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `endpoint` in JSON is `endpoint`
     * `mapping` in JSON is `mapping`
     */
    private enum CodingKeys: String, CodingKey {
        
        case endpoint
        case mapping
    }
    
    // MARK: - Variables

    /// The endpoint
    public var endpoint: String = ""
    /// The mapping of the endpoint
    public var mapping: [String: String] = [:]
}
