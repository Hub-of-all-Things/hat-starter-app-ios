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

public struct HATDataDefinitionBundleKeyEndpoints: HATObject {
    
    // MARK: - Coding Keys
    
    /**
     The JSON fields used by the hat
     
     The Fields are the following:
     * `endpoint` in JSON is `endpoint`
     * `mapping` in JSON is `mapping`
     * `filters` in JSON is `filters`
     * `links` in JSON is `links`
     */
    private enum CodingKeys: String, CodingKey {
        
        case endpoint
        case mapping
        case filters
        case links
    }
    
    // MARK: - Variables
    
    /// The endpoint that we want access to, eg facebook/feed
    public var endpoint: String = ""
    /// The mapping to apply in the endpoint, meaning which fields you want to access from that endpoint. Optional
    public var mapping: Dictionary<String, String>?
    /// The filters to apply in the endpoint, like if you want to `find` something in one of the fields stated in the mapping. Optional
    public var filters: [HATDataDefinitionBundleFilters]?
    /// The links of the definition object. Optional
    public var links: [HATDataDefinitionBundleKeyEndpoints]?
    
    // MARK: - Initializer
    
    /**
     Initializing a `DataOfferRequiredDataDefinitionBundleKeyEndpointsV2` from specific values
     
     - parameter endpoint: The endpoint of the definition object
     */
    public init(endpoint: String) {
        
        self.endpoint = endpoint
    }
}
