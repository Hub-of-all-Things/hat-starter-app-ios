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

public struct HATProfileBundle: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `name` in JSON is `name`
     * `bundle` in JSON is `bundle`
     */
    private enum CodingKeys: String, CodingKey {
        
        case name
        case bundle
    }
    
    // MARK: - Variables
    
    /// The name of the bundle, it has to be unique
    public var name: String = ""
    /// The bundle describing the bundle info, like what endpoints and what fields it would need to access
    public var bundle: [String: HATProfileBundleData] = [:]
}
