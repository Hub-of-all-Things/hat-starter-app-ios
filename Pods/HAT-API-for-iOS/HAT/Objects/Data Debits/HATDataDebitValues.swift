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

// MARK: - Struct

public struct HATDataDebitValues: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `conditions` in JSON is `conditions`
     * `bundle` in JSON is `bundle`
     */
    private enum CodingKeys: String, CodingKey {
        
        case conditions
        case bundle
    }
    // MARK: - Variables
    
    /// The conditions. For every endpoint specified in the bundle it will be true if the data are there and have been taken or false indicating the data are not there. Optional
    public var conditions: [String: Bool]?
    /// The bundle. It has all sorts of info about which endpoint and fields it can access. Also about mapping and filtering those fields. Optional
    public var bundle: [String: [HATDataDefinitionBundleKeyEndpoints]]?
    
    // MARK: - Initialiazer
    
    /**
     Initializing an empty `DataDebitValuesObject`
     */
    public init() {
        
    }
}
