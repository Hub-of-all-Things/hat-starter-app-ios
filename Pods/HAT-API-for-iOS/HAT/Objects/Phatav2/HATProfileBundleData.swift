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

public struct HATProfileBundleData: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `endpoints` in JSON is `endpoints`
     * `orderBy` in JSON is `orderBy`
     * `ordering` in JSON is `ordering`
     * `limit` in JSON is `limit`
     */
    private enum CodingKeys: String, CodingKey {
        
        case endpoints
        case orderBy
        case ordering
        case limit
    }
    
    // MARK: - Variables

    /// The endpoints that are included in the bundle
    public var endpoints: [HATProfileBundleEndpoints] = []
    /// The field to order the table
    public var orderBy: String = ""
    /// Ordering of the data. Can be `descending` or `ascending`
    public var ordering: String = ""
    /// The limit of records to include to the bundle. Optional
    public var limit: Int?
}
