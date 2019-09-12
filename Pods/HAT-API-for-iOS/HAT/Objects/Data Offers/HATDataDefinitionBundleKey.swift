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

public struct HATDataDefinitionBundleKey: HATObject {
    
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
    
    /// The endpoints that you request access to
    public var endpoints: [HATDataDefinitionBundleKeyEndpoints] = []
    /// The ordering filter of the endpoints. You can order by field per endpoint. Optional
    public var orderBy: String?
    /// The order, ascending of descending. Optional
    public var ordering: String?
    /// The limit of the filter. You can limit the amount of items per endpoint. Optional
    public var limit: Int?
    
    // MARK: - Initializer
    
    /**
     Initializing a `DataOfferRequiredDataDefinitionBundleKeyV2` from specific values
     
     - parameter endpoints: The endpoints of the definition
     */
    public init(endpoints: [HATDataDefinitionBundleKeyEndpoints]) {
        
        self.endpoints = endpoints
    }
}
